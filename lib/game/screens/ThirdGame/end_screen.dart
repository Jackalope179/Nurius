import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/intro_game_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text(
                'Gửi phản hồi',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://docs.google.com/forms/d/e/1FAIpQLScvMiqFdZpBAxmU30bkfFrLrN5sJOuLxt14zf-c1Ta6jrl__w/viewform');
                if (!await launchUrl(url)) throw 'Could not launch $url';
              },
            ),
            OutlinedButton(
              child: const Text(
                'Đến màn hình chính',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                ProgressBar.mana = 1;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                    (route) => true);
              },
            ),
          ],
        );
      },
    );
  }
}
