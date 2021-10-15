import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shakshuka/services/firestore_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this enum will be used to track the login state of the user
enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}
//AuthProvider is a changeNotifer which allows other objects to subscribe to listen for changes
// when the users state changes all listeners will be notifed

// this will act as out basic state mangment solution
class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final SharedPreferences prefs;

  Status _status = Status.uninitialized;

  Status get status => _status;

  AuthProvider({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.prefs,
    required this.firebaseFirestore,
  });

  //retrives firebaseUserId from local cache instead of from the cloud
  String? getFirebaseUserId() {
    return prefs.getString(FirestoreConstants.id);
  }

  // checks the google login state
  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn &&
        prefs.getString(FirestoreConstants.id)?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  // this function does all the heavy lifting for signing google users
  // if the user does not have an account it register them for one
  // however if the user does have an account already it signs them in
  Future<bool> handelSignIn() async {
    _status = Status.authenticating;
    notifyListeners();

    // wait for a response to sign in with google and stores the results of that action in the final variable AuthCredential
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // then take those google user credientials and convert it into a firebase user
      User? firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;
      // if the firebase user is not null search out database for the user and stoer the result in document
      if (firebaseUser != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> document = result.docs;
        // if the document is empty  add the user to you firebase database as a new user
        if (document.isEmpty) {
          firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .set({
            FirestoreConstants.nickname: firebaseUser.displayName,
            FirestoreConstants.id: firebaseUser.uid,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          });
          // stores the user to local prefs
          User? currentUser = firebaseUser;
          await prefs.setString(FirestoreConstants.id, currentUser.uid);
          await prefs.setString(
              FirestoreConstants.nickname, currentUser.displayName ?? "");
        } else {
          DocumentSnapshot documentSnapshot = document[0];
          //TODO implement fetching pre-exsisting userdata from firestore
        }
        _status = Status.authenticated;
        notifyListeners();
        return true;
      } else {
        _status = Status.authenticateError;
        notifyListeners();
        return false;
      }
    } else {
      _status = Status.authenticateCanceled;
      notifyListeners();
      return false;
    }
  }

  Future<void> handleSignOut() async {
    _status = Status.uninitialized;
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}
