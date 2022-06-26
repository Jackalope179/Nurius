import 'package:flutter/material.dart';

class Utils {
  static void navigateForwardfunction(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: widget.toStringShort()));
    Navigator.of(context, rootNavigator: true).push(route);
  }

  static void popBack(BuildContext context, String screen, Widget screen_) {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.settings.name == screen);
    // handle black screen
    // Utils.navigateForwardfunction(context, screen_);
  }

  static void showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showMyDialog(
      BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.pink[400],
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Đóng',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
