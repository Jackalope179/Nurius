import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

class Utils {
  static void navigateForwardfunction(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: widget.toStringShort()));
    Navigator.push(context, route);
  }

  static void popBack(BuildContext context, String screen) {
    Navigator.of(context).popUntil((route) => route.settings.name == screen);
  }

  static void showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
