import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shakshuka/models/user_model.dart';
import 'package:shakshuka/models/firestore_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this enum will be used to track the login state of the user
// this will act as out basic state mangment solution
enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}

//AuthProvider is a changeNotifer which allows other objects to subscribe to listen for changes
// when the users state changes all listeners will be notifed
class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final SharedPreferences prefs;
  // initialise our status as unintilized
  // we will be using status as a means of tracking user signed in state durring login
  Status _status = Status.uninitialized;

  Status get status => _status;

  // constructor for AuthProvider, all of the following variables will be required to be passed in when called
  AuthProvider({
    required this.auth,
    required this.googleSignIn,
    required this.prefs,
    required this.db,
  });
  // this is used to fetch the Firebase User Id from the local shared preferences
  String? getUserFirebaseId() {
    return prefs.getString(FirestoreUserConstants.id);
  }

  // will check if a users is signed in
  Future<bool> isLoggedIn() async {
    // get the loggedIn state from google
    bool isLoggedIn = await googleSignIn.isSignedIn();
    // A user is only consideried signedIn if both local shared prefrences and the googleSignIn agree on useres signed in state
    if (isLoggedIn &&
        prefs.getString(FirestoreUserConstants.id)?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  // The main bread and butter of the AuthProviders class
  // this function will return some time in the future with a boolean result of what happend durring sign in it will also update our _status
  Future<bool> handelGoogleSignIn() async {
    // change state to autherticating and notify all listeners of this change
    _status = Status.authenticating;
    notifyListeners();
    // wait for a result from google sign in
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // if we get a value back then we can continue
    if (googleUser != null) {
      //wait for google to autheticate the user
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      // then when autheticated we can bind the google credientials to our firebase AuthCredentials
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // next we take those credentials and then with firebase we wait to assign them to a firebaseUser
      User? firebaseUser = (await auth.signInWithCredential(credential)).user;
      // when the firebase user has been assigned we can query our database for the user
      if (firebaseUser != null) {
        final QuerySnapshot result = await db
            .collection(FirestoreUserConstants.pathUserCollection)
            .where(FirestoreUserConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        // we bind the results of that query to document for addiational checks
        final List<DocumentSnapshot> document = result.docs;
        // first we check to see if the user we quried for even exsists
        if (document.isEmpty) {
          // If the user does not exsit then we add them to our database as a new user
          db
              .collection(FirestoreUserConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .set({
            FirestoreUserConstants.nickname: firebaseUser.displayName,
            FirestoreUserConstants.photoUrl: firebaseUser.photoURL,
            FirestoreUserConstants.id: firebaseUser.uid,
            'createdAt': DateTime.now().microsecondsSinceEpoch.toString()
          });
          User? currentUser = firebaseUser;
          await prefs.setString(FirestoreUserConstants.id, currentUser.uid);
          await prefs.setString(
              FirestoreUserConstants.nickname, currentUser.displayName ?? "");
          await prefs.setString(
              FirestoreUserConstants.photoUrl, currentUser.photoURL ?? "");
        } // if the user does exsit in our db then we can set our local shared prefrences to be that firebase user
        // this stores their Creds locally
        else {
          DocumentSnapshot documentSnapshot = document[0];
          UserModel userModel = UserModel.fromDocument(documentSnapshot);
          await prefs.setString(FirestoreUserConstants.id, userModel.id);
          await prefs.setString(
              FirestoreUserConstants.nickname, userModel.nickname);
          await prefs.setString(
              FirestoreUserConstants.photoUrl, userModel.photoUrl);
        }
        // after we either sign them in or register them we change our state to autheticated and notify any listeners that are waiting for a result
        _status = Status.authenticated;
        notifyListeners();
        return true;
      } //if firebaseUser != null statment
      //  however if the user cann not be signed in then we change the state to an authenticateError and notify any listeners that the user could not be signed in
      else {
        _status = Status.authenticateError;
        notifyListeners();
        return false;
      }
    }
    // if there is no error but the user was not signed in that means the signIn was canled by the user and listeners have to be notifed of that change as well
    else {
      _status = Status.authenticateCanceled;
      notifyListeners();
      return false;
    }
  }

  // signs a google user out of their account and sets the status back to uninitlized
  Future<void> handleGoogleSignOut() async {
    _status = Status.uninitialized;
    await auth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}
