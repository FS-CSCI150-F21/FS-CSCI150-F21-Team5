import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:get/get.dart';
import 'package:shakshuka/widgets/loadding_view.dart';
import 'search.dart';

import '../main.dart';

// Login screen is where unregistered and signed out users will be direct so that they may insert their credientials
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // if the statemangement logic says their was an error logining in it will display a sanckbar informing the user of the error
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Get.snackbar("Error", "Authetication failed");
        break;
      case Status.authenticateCanceled:
        Get.snackbar("Error", "Authetication failed");
        break;
      default:
        break;
    }
    // the main ui elements of the login in screen
    // TODO: refactor the code so that it is an elvated button that calls on handelGoogleSignIn
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Card(
              borderOnForeground: true,
              child: Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      bool isSuccess = await authProvider.handelGoogleSignIn();
                      if (isSuccess) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      }
                    },
                    child: const Text('Log in with Google'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                    child: const Text('Log in with Apple'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                    child: const Text('Log in Email'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                    child: const Text('Register with Email'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Search()))
                    },
                    child: const Text('Secret Portal'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
