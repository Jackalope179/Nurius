import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nurnius/common/progress_bar.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showMyDialog(context));
    return Scaffold(
      body: Image.asset(
        'assets/images/bg3.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.pinkAccent,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'chúng mình sẽ có màn chơi sớm thôi'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Đến màn hình chính',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).popUntil(
                    (route) => route.settings.name == "FirstGameScreen");
                Navigator.of(context).pop();
                ProgressBar.mana = 1;
              },
            ),
          ],
        );
      },
    );
  }
}
