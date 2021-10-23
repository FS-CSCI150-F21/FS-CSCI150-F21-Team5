import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:get/get.dart';
import 'package:shakshuka/widgets/loadding_view.dart';

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
          Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("res/img/shaksuka.png")),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            // when the image is pressed it will call handelGoogleSignIn so that the user can provider their credientials
            // auth_providers.dart in the services folder will handel all the logic for signIn and registration
            child: GestureDetector(
              onTap: () async {
                bool isSuccess = await authProvider.handelGoogleSignIn();
                if (isSuccess) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child: Image.asset("img/google_login.jpg"),
            ),
          ),
          Positioned(
            child: authProvider.status == Status.authenticating
                ? LoadingView()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
