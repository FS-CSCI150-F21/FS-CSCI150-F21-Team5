import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:shakshuka/widgets/loadding_view.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Get.snackbar("Error", "Authetication error");
        break;
      case Status.authenticated:
        break;
      case Status.uninitialized:
        Get.snackbar("", "Not Signed In");
        break;
      case Status.authenticating:
        Get.snackbar("Please wait", "Auhtenticating");
        break;
      case Status.authenticateCanceled:
        Get.snackbar("Cancel", "Login Canceled");
        break;
    }
    var asset;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            //add real img
            child: Image.asset("res/img/shoppingcart.jpg"),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () async {
                bool isSuccess = await authProvider.handelSignIn();
                if (isSuccess) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              //TODO : include image
              child: Image.asset("res/img/googleSignIn.jpg"),
            ),
          ),
          Positioned(
            child: authProvider.status == Status.authenticating
                ? LoadingView()
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
