import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login_registration/login.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: Login(),
        duration: 1000,
        imageSize: 130,
        imageSrc: "splashscreen_image.png",
        text: "Welcome",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 40.0,
        ),
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
