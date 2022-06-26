import 'package:flutter/material.dart';
import 'package:nurnius/common/Utils.dart';
import 'package:nurnius/common/metadata.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/game/screens/ReviewGame/question1.dart';
import 'package:nurnius/game/screens/ReviewGame/questions_screen.dart';
import 'package:nurnius/game/screens/first_game_screen.dart';
import 'package:nurnius/game/screens/second_game_screen.dart';
import 'package:nurnius/game/screens/third_game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  MapScreen({Key? key, required this.screen}) : super(key: key);
  String screen;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<TargetFocus> targets = [];
  // GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();
  GlobalKey key5 = GlobalKey();
  int number = 1;

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

  @override
  void initState() {
    checkPlayed();
    super.initState();
  }

  void checkPlayed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    bool? ReviewGamePlayed = prefs.getBool('ReviewGamePlayed');
    if (ReviewGamePlayed != null && ReviewGamePlayed == false) {
      initTargets();
      WidgetsBinding.instance.addPostFrameCallback((_afterLayout) {
        showTutorial();
      });
    }
    await prefs.setBool('ReviewGamePlayed', true);
  }

  void _afterLayout() {
    Future.delayed(const Duration(microseconds: 100));
  }

  void initTargets() {
    targets.add(TargetFocus(identify: "Target 2", keyTarget: key2, contents: [
      TargetContent(
          align: ContentAlign.bottom,
          child: Container(
              child: Column(
            children: [
              Text(
                "Quay lại màn hình game".toUpperCase(),
                style: const TextStyle(
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
                "Nhấn vào hình tròn để chọn màn chơi, màn chơi được mở khoá khi bạn đã chơi "
                    .toUpperCase(),
                style: const TextStyle(
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
                "Nhấn vào lá cờ để vào màn review".toUpperCase(),
                style: const TextStyle(
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        body: Stack(children: [
          Image.asset(
            'assets/images/bg_review.jpeg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            key: key2,
            top: 15,
            left: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 45,
                )),
          ),
          Positioned(
              top: -20,
              left: MediaQuery.of(context).size.width * 0.2,
              child: const ProgressBar()),
          Container(key: key3, child: buildCircle(0.3, 0.15, "1")),
          buildCircle(0.55, 0.35, "2"),
          buildCircle(0.23, 0.54, "3"),
          buildCircle(0.58, 0.7, "4"),
          Positioned(
            key: key4,
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.65,
            child: IconButton(
                onPressed: () {
                  if (GameMetaData.ThirdGamePlayed) {
                    Utils.navigateForwardfunction(
                        context, QuestionScreen(screen: widget.screen));
                  } else {
                    Utils.showMyDialog(
                        context,
                        'chưa thể mở review'.toUpperCase(),
                        "Bạn phải chơi hết màn 3 mới mở được review");
                  }
                },
                icon: Icon(
                  Icons.flag,
                  color: GameMetaData.ThirdGamePlayed
                      ? Colors.red
                      : Colors.red[100],
                  size: 65,
                )),
          ),
        ]),
      ),
    );
  }

  Widget buildCircle(double top, double left, String content) {
    Color? outerBgColor = Colors.blue[100];
    Color? innerBgColor = Colors.pink[100];

    if (content == "1" && GameMetaData.FirstGamePlayed) {
      outerBgColor = Colors.blue[300];
      innerBgColor = Colors.pinkAccent;
    } else if (content == "2" && GameMetaData.SecondGamePlayed) {
      outerBgColor = Colors.blue[300];
      innerBgColor = Colors.pinkAccent;
    } else if (content == "3" && GameMetaData.ThirdGamePlayed) {
      outerBgColor = Colors.blue[300];
      innerBgColor = Colors.pinkAccent;
    }
    return Positioned(
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: GestureDetector(
        onTap: () {
          if (content == "4") {
            _showMyDialog();
          } else {
            setState(() {
              number = int.parse(content);
            });
            // Utils.navigateForwardfunction(
            //     context, QuestionScreen(screen: widget.screen));
          }

          if (content == "1" && GameMetaData.FirstGamePlayed) {
            Utils.navigateForwardfunction(
                context, FirstGameScreen(replay: true));
          } else if (content == "2" && GameMetaData.SecondGamePlayed) {
            Utils.navigateForwardfunction(
                context, SecondGameScreen(replay: true));
          } else if (content == "3" && GameMetaData.ThirdGamePlayed) {
            Utils.navigateForwardfunction(
                context, ThirdGameScreen(done: false, replay: true));
          } else {
            Utils.showMyDialog(context, 'chưa thể mở màn chơi'.toUpperCase(),
                "Bạn phải chơi  qua màn chơi này mới mở lại được");
          }
        },
        child: CircleAvatar(
            backgroundColor: outerBgColor,
            radius: 40,
            child: CircleAvatar(
              backgroundColor: innerBgColor,
              radius: 33,
              child: Text(
                content,
                style: const TextStyle(fontSize: 30),
              ),
            )),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Xin lỗi, tính năng này chưa mở khoá 😅",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  "Tính năng này đang trong thời gian phát triển và \n sẽ mở khoá sau",
                  style: TextStyle(color: Colors.white),
                ),
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
