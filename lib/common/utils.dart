import 'package:flutter/material.dart';

class Utils {
  static void navigateForwardfunction(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: widget.toStringShort()));
    Navigator.push(context, route);
  }
}
