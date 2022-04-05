import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  Alert({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      title: Column(children: [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 80,
        ),
        // Padding(padding: EdgeInsets.only(bottom: 10)),
        // Text(
        //   "Error",
        //   style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        // ),
      ]),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "Dismiss",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
