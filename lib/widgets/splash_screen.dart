import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:shakshuka/main.dart';
import 'package:shakshuka/screens/all_recipes.dart';
import 'package:shakshuka/services/auth_provider.dart';

import '../screens/login.dart';

// * this is where the app will first load into
//  This class checks for users current state if they are signed in then it will redirect them to the Home screen
// otherwise it will redirect them to the Login screen for signing, validation, and authorization
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //TODO: reimpliment this function so that it shows a platform native splash screen instead
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignIn();
    });
  }

  void checkSignIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AllRecipes()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
    return;
  }

  // this is the actual splashscreen that will be displayed while we check for user's sign in state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //TODO: add proper image asset for splash screen
          Image.asset(
            "res/img/sakshuka.png",
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 20),
          const Text("Recipe Manager"),
        ],
      ),
    ));
  }
}
