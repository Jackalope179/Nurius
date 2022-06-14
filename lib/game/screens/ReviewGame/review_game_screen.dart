import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nurnius/common/progress_bar.dart';

// ignore: must_be_immutable
class ReviewGameScreenResult extends StatelessWidget {
  ReviewGameScreenResult(
      {Key? key, required this.totoalCorrectAnswers, required this.screen})
      : super(key: key);
  int totoalCorrectAnswers;
  String screen;
  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showMyDialog(context));
    return Scaffold(
      body: Image.asset(
        'assets/images/bg1.png',
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
                  'chúc mừng bạn đã vượt qua màn review'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {
                  if (!ProgressBar.isPlayed) {
                    ProgressBar.mana += totoalCorrectAnswers * 0.1;
                    ProgressBar.isPlayed = true;
                  }
                  if (ProgressBar.mana > 1) {
                    ProgressBar.mana = 1;
                  }
                  // print("curr mana" + ProgressBar.mana.toString());
                  // int count = 0;
                  // Navigator.of(context).popUntil((_) => count++ >= 5);
                  Navigator.of(context)
                      .popUntil((route) => route.settings.name == screen);
                },
                child: Text(
                  'xác nhận'.toUpperCase(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
