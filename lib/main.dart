import 'package:flutter/material.dart';
import 'package:shakshuka/login.dart';

void main() {
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
        home: LoginView());
  }
}
