import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:songs_generator/screens/chat_screen.dart';
import 'package:songs_generator/screens/login_screen.dart';
import 'package:songs_generator/screens/registration_screen.dart';
import 'package:songs_generator/screens/splash_screen.dart';
import 'package:songs_generator/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SongsGenerator());
}

class SongsGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            ChatScreen.id: (context) => ChatScreen(),
          },
        ),
      );
}
