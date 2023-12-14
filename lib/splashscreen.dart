import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/welcome.dart';


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: Image(image: AssetImage("images/Hulu-Logo 1.png"),),
      nextScreen: Welcome(),
      duration: 4000,
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,

    );



  }

}
