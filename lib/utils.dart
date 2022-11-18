import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String message, Color toastColor) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    webPosition: "center",
    webShowClose: true,
    timeInSecForIosWeb: 5,
    backgroundColor: toastColor,
    webBgColor: '#${toastColor.value.toRadixString(16).substring(2)}',
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
