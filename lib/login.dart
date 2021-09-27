import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late String _email;
  late String _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                ),
                TextFormField(
                  obscureText: true,
                ),
              ],
            ),
          )),
    );
  }
}
