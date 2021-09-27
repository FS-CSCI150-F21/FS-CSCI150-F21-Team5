import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  void validate() {
    final form = formKey.currentState;
    if (!form!.validate()) {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Email cannot be empty' : null,
                  onSaved: (value) => _email = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Password cannot be empty' : null,
                  onSaved: (value) => _password = value!,
                ),
                ElevatedButton(onPressed: validate, child: const Text('Login'))
              ],
            ),
          )),
    );
  }
}
