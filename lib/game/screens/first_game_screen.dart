import 'package:flutter/material.dart';
import 'package:nurnius/common/exit_btn.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/common/review_btn.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/FirstGame/first_game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// ignore: must_be_immutable
class FirstGameScreen extends StatefulWidget {
  FirstGameScreen({Key? key, required this.replay}) : super(key: key);
  bool replay;
  @override
  State<FirstGameScreen> createState() => _FirstGameScreenState();
}

class _FirstGameScreenState extends State<FirstGameScreen> {
  String path = 'assets/images/baby1.png';
  double left = 0;
  bool isPressed = false;
  List<TargetFocus> targets = [];
  // GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();
  GlobalKey key5 = GlobalKey();

  @override
  void initState() {
    checkPlayed();

    super.initState();
  }

  void checkPlayed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    bool? FirstGamePlayed = prefs.getBool('FirstGamePlayed');
    if (FirstGamePlayed != null && FirstGamePlayed == false) {
      initTargets();
      WidgetsBinding.instance.addPostFrameCallback((afterLayout) {
        showTutorial();
      });
    }
    await prefs.setBool('FirstGamePlayed', true);
  }

  void initTargets() {
    targets.add(TargetFocus(identify: "Target 2", keyTarget: key2, contents: [
      TargetContent(
          align: ContentAlign.bottom,
          child: Container(
              child: Column(
            children: [
              Text(
                "Xem và lựa chọn các màn chơi mong muốn".toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ],
          ))),
    ]));
    targets.add(TargetFocus(identify: "Target 3", keyTarget: key3, contents: [
      TargetContent(
          align: ContentAlign.top,
          child: Container(
              child: Column(
            children: [
              Text(
                "Giữ nút để di chuyển em bé về phía sau".toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ],
          ))),
    ]));
    targets.add(TargetFocus(identify: "Target 4", keyTarget: key4, contents: [
      TargetContent(
          align: ContentAlign.top,
          child: Container(
              child: Column(
            children: [
              Text(
                "Giữ nút để di chuyển em bé về phía trước".toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ],
          ))),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width - left < 100) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!widget.replay) {
          ProgressBar.mana -= 0.3;
        }
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
          // create global key for button

          Container(
            // key: key1,
            child: ExitBtn(),
          ),
          Positioned(
            key: key5,
            top: -25,
            left: MediaQuery.of(context).size.width * 0.25,
            child: const ProgressBar(),
          ),
          Container(key: key2, child: ReviewButton(screen: "FirstGameScreen")),
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
              key: key3,
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
              key: key4,
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

  void showTutorial() {
    TutorialCoachMark tutorial = TutorialCoachMark(
      context,
      targets: targets, // List<TargetFocus>
      colorShadow: Colors.blueAccent, // DEFAULT Colors.black
      // alignSkip: Alignment.bottomRight,
      opacityShadow: 0.7,
      // textSkip: "SKIP",
      // paddingFocus: 10,
    )..show();
  }
}
