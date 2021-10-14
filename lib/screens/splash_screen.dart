import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:shakshuka/main.dart';
import 'package:shakshuka/services/auth_provider.dart';

import 'login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
    checkSignIn();
  });
  }

  void checkSignIn() async{
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if(isLoggedIn){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
    return;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          //TODO: add image asset for splash screen
            Image.asset(
              "res/img/shopping-cart.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              "Recipe Manager"
            ),
          ],
        ),
      )

    );
  }
}

