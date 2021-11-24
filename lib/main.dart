import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/widgets/splash_screen.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'recipe.dart';
import 'recipe_card.dart';
import 'screens/search.dart';




//import 'screens/home_page.dart';
import 'screens/recipe_page.dart';
//import 'screens/grocery_page.dart';
import 'screens/search_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //int _selectedIndex = 0;
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  // intit states for firebase instance
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //require that that prefs be passed in when MyApp is called
  MyApp({Key? key, required this.prefs}) : super(key: key);

  // with all values passed in we now intilize our auth provider with that data by shadowing the variables
  // this will also help us determin the login state of the user in the splash screen
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
              auth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
              // ignore: unnecessary_this
              prefs: this.prefs,
              // ignore: unnecessary_this
              db: this.firebaseFirestore,
            ),
          ),
        ],
        // this will return splash screen which will determin where to redirect useres based on login state
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shakshuka',
            home: SplashPage()));
  }
}


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(16.0),
        child: const TextField(),
      ),
    );
  }
}


