import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Utils {
  static void showTopSnackBar(
    BuildContext context,
    String message,
    Color color,
  ) =>
      showSimpleNotification(
        Text(message),
        // subtitle: Text(result),
        background: color,
        elevation: 150,
        // autoDismiss: false,
        // duration: Duration(seconds: 10),
      );
}

// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class CheckConnection extends StatefulWidget {
//   @override
//   State createState() {
//     return _CheckConnection();
//   }
// }
//
// class _CheckConnection extends State {
//   StreamSubscription internetConnection;
//   bool isOffline = false;
//   //set variable for Connectivity subscription listener
//
//   @override
//   void initState() {
//     internetConnection = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       // whenever connection status is changed.
//       if (result == ConnectivityResult.none) {
//         //there is no any connection
//         setState(() {
//           isOffline = true;
//         });
//       } else if (result == ConnectivityResult.mobile) {
//         //connection is mobile data network
//         setState(() {
//           isOffline = false;
//         });
//       } else if (result == ConnectivityResult.wifi) {
//         //connection is from wifi
//         setState(() {
//           isOffline = false;
//         });
//       }
//     }); // using this listener, you can get the medium of connection as well.
//
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     super.dispose();
//     internetConnection.cancel();
//     //cancel internet connection subscription after you are done
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         // height: 10,
//         child: errMsg("No Internet Connection Available", isOffline),
//         //to show internet connection message on isOffline = true.
//       ),
//     );
//   }
//
//   Widget errMsg(String text, bool show) {
//     //error message widget.
//     if (show == true) {
//       //if error is true then show error message box
//       return Container(
//         padding: EdgeInsets.all(10.00),
//         margin: EdgeInsets.only(bottom: 10.00),
//         color: Colors.red,
//         child: Row(children: [
//           Container(
//             margin: EdgeInsets.only(right: 6.00),
//             child: Icon(Icons.info_outline, color: Colors.white),
//           ), // icon for error message
//
//           Text(text, style: TextStyle(color: Colors.white)),
//           //show error message text
//         ]),
//       );
//     } else {
//       return Container();
//       //if error is false, return empty container.
//     }
//   }
// }
