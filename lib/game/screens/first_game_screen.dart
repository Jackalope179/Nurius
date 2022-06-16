import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/exit_btn.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/common/review_btn.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/FirstGame/first_game.dart';

class FirstGameScreen extends StatefulWidget {
  const FirstGameScreen({Key? key}) : super(key: key);

  @override
  State<FirstGameScreen> createState() => _FirstGameScreenState();
}

class _FirstGameScreenState extends State<FirstGameScreen> {
  String path = 'assets/images/baby1.png';
  double left = 0;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width - left < 100) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ProgressBar.mana -= 0.3;
        Utils.navigateForwardfunction(context, const FirstGame());
      });
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Image.asset(
            'assets/images/bg2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ExitBtn(),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width * 0.3,
            child: const ProgressBar(),
          ),
          ReviewButton(screen: "FirstGameScreen"),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: MediaQuery.of(context).size.height * 0.5,
            left: left,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onLongPressStart: (_) async {
                isPressed = true;
                do {
                  setState(() {
                    if (path == 'assets/images/baby1.png') {
                      path = 'assets/images/baby2.png';
                    } else if (path == 'assets/images/baby2.png') {
                      path = 'assets/images/baby3.png';
                    } else {
                      path = 'assets/images/baby1.png';
                    }
                    if (left > 0) {
                      left -= 10;
                    }
                  });
                  await Future.delayed(const Duration(milliseconds: 100));
                } while (isPressed);
              },
              onLongPressEnd: (_) => setState(() => isPressed = false),
              child: FloatingActionButton(
                  heroTag: 'btn1', child: createButton(2), onPressed: () {}),
            ),
            GestureDetector(
              onLongPressStart: (_) async {
                isPressed = true;
                do {
                  if (mounted) {
                    setState(() {
                      if (path == 'assets/images/baby1.png') {
                        path = 'assets/images/baby2.png';
                      } else if (path == 'assets/images/baby2.png') {
                        path = 'assets/images/baby3.png';
                      } else {
                        path = 'assets/images/baby1.png';
                      }
                      left += 10;
                    });
                  }
                  await Future.delayed(const Duration(milliseconds: 100));
                } while (isPressed &&
                    MediaQuery.of(context).size.width - left >= 100);
              },
              onLongPressEnd: (_) {
                setState(() => isPressed = false);
              },
              child: FloatingActionButton(
                  heroTag: 'btn2', child: createButton(1), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget createButton(int type) {
    return type == 1
        ? const Icon(
            Icons.arrow_right,
            size: 35,
          )
        : const Icon(
            Icons.arrow_left,
            size: 35,
          );
  }
}
