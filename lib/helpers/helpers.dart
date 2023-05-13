import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  static void showSnackBar(String value, scaffoldKey) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  static void showToast(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showBottomSheet(Widget child, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
