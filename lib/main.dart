import 'package:flutter/material.dart';
import 'package:shakshuka/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shakshuka/screens/wrapper.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primaryColor: Colors.red[700],
      ),
      home: Wrapper(),
    );
  }
}
