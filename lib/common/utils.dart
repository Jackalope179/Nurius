import 'package:flutter/material.dart';

class Utils {
  static void navigateForwardfunction(BuildContext context, Widget widget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }
}
