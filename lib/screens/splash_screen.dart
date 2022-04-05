import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:songs_generator/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 80.0,
              ),
            ),
            Row(
              children: <Widget>[
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Songs Generator',
                      textStyle: TextStyle(
                        fontSize: 44.0,
                      ),
                      colors: colorizeColors,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class SplashScreens extends StatefulWidget {
//   static String id = 'splash_screen';
//
//   @override
//   _SplashScreensState createState() => _SplashScreensState();
// }
//
// class _SplashScreensState extends State<SplashScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 14,
//       navigateAfterSeconds: WelcomeScreen.id,
//       backgroundColor: Colors.white,
//       useLoader: false,
//     );
//   }
// }
