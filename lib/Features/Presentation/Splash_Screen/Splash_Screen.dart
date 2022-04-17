import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Authentification/Login_screen.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenui extends StatelessWidget {
  const SplashScreenui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return SplashScreenView(
      navigateRoute: (_auth.currentUser != null) ? MainScreen() : LoginScreen(),
      duration: 4000,
      imageSize: 200,
      imageSrc: "assets/images/logo/logo.png",
      text: "Welcome",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: KbackgroundColor,
    );
  }
}
