import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ndialog/ndialog.dart';
import 'package:songs_generator/components/alert_dialog.dart';
import 'package:songs_generator/components/rounded_button.dart';
import 'package:songs_generator/components/snackbar.dart';

import '../constants.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet ? 'You are online' : 'You are offline';
    final color = hasInternet ? Colors.green : Colors.red;

    Utils.showTopSnackBar(context, message, color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  decoration: KTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  obscureText: _isVisible ? false : true,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                  decoration: KTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      onPressed: () => updateStatus(),
                      icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  )),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register ',
                color: Colors.blueAccent,
                onPressed: () async {
                  final result = await Connectivity().checkConnectivity();
                  if (result == ConnectivityResult.none) {
                    showConnectivitySnackBar(result);
                  } else {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      if (e.toString() ==
                          '[firebase_auth/weak-password] Password should be at least 6 characters') {
                        await DialogBackground(
                            dialog: Alert(
                          text: 'Password should be at least 6 characters.',
                        )).show(context);
                      }
                      if (e.toString() == '[firebase_auth/unknown] null') {
                        await DialogBackground(
                            dialog: Alert(
                          text: 'Please fill up the email/password filed.',
                        )).show(context);
                      }
                      if (e.toString() ==
                          '[firebase_auth/invalid-email] The email address is badly formatted.') {
                        await DialogBackground(
                            dialog: Alert(
                          text: 'The email address is badly formatted.',
                        )).show(context);
                      }
                      if (e.toString() ==
                          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
                        await DialogBackground(
                            dialog: Alert(
                          text:
                              'The email address is already in use by another account.',
                        )).show(context);
                      }
                      print(e);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
