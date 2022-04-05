import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:songs_generator/components/snackbar.dart';
import 'package:songs_generator/components/rounded_button.dart';
import 'package:songs_generator/screens/registration_screen.dart';

import 'login_screen.dart';

const colorizeColors = [
  Colors.black87,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  static final String title = 'Has Internet?';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
// with TickerProviderStateMixin
{
  // StreamSubscription subscription;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   subscription =
  //       Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  // }
  //
  // @override
  // void dispose() {
  //   subscription.cancel();
  //
  //   super.dispose();
  // }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet ? 'You are online' : 'You are offline';
    final color = hasInternet ? Colors.green : Colors.red;

    Utils.showTopSnackBar(context, message, color);
  }
  // AnimationController controller;
  // Animation animation;

  // @override
  // void initState() {
  //   super.initState();
  //   controller =
  //       AnimationController(duration: Duration(seconds: 1), vsync: this);
  //
  //   animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
  //       .animate(controller);
  //   controller.forward();
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
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
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () async {
                final result = await Connectivity().checkConnectivity();
                if (result == ConnectivityResult.none) {
                  showConnectivitySnackBar(result);
                } else {
                  Navigator.pushNamed(context, LoginScreen.id);
                }
              },
            ),
            RoundedButton(
              title: 'Register ',
              color: Colors.blueAccent,
              onPressed: () async {
                final result = await Connectivity().checkConnectivity();
                if (result == ConnectivityResult.none) {
                  showConnectivitySnackBar(result);
                } else {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
