import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListnersUtils {
  showToastMessage(String message, Color colors) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: colors,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showFlushbarMessage(
      String message,
      Color colors,
      Color titleTextColor,
      String titleText,
      IconData icon,
      BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          title: titleText,
          titleColor: titleTextColor,
          message: message,
          flushbarPosition: FlushbarPosition.BOTTOM,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.elasticOut,
          backgroundColor: colors,
          showProgressIndicator: true,
          progressIndicatorBackgroundColor: Color.fromARGB(255, 255, 221, 0),
          isDismissible: false,
          duration: Duration(seconds: 3),
          icon: Icon(
            icon,
            color: titleTextColor,
          ),
          titleText: Text(
            titleText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                color: titleTextColor,
                fontFamily: "ShadowsIntoLightTwo"),
          ),
          messageText: Text(
            message,
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: "ShadowsIntoLightTwo"),
          ),
        )..show(context));
  }
}
