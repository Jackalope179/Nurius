import 'package:flutter/material.dart';
import 'package:nurnius/common/Utils.dart';
import 'package:nurnius/common/metadata.dart';
import 'package:nurnius/common/progress_bar.dart';
import 'package:nurnius/game/screens/ReviewGame/question1.dart';
import 'package:nurnius/game/screens/ReviewGame/questions_screen.dart';
import 'package:nurnius/game/screens/first_game_screen.dart';
import 'package:nurnius/game/screens/second_game_screen.dart';
import 'package:nurnius/game/screens/third_game_screen.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  MapScreen({Key? key, required this.screen}) : super(key: key);
  String screen;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int number = 1;
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
            top: 15,
            left: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 45,
                )),
          ),
          Positioned(
              top: -20,
              left: MediaQuery.of(context).size.width * 0.2,
              child: ProgressBar()),
          buildCircle(0.3, 0.15, "1"),
          buildCircle(0.55, 0.35, "2"),
          buildCircle(0.23, 0.54, "3"),
          buildCircle(0.58, 0.7, "4"),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.65,
            child: IconButton(
                onPressed: () {
                  Utils.navigateForwardfunction(
                      context, QuestionScreen(screen: widget.screen));
                },
                icon: Icon(
                  Icons.flag,
                  color: Colors.red,
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
            Utils.navigateForwardfunction(context, FirstGameScreen());
          } else if (content == "2" && GameMetaData.SecondGamePlayed) {
            Utils.navigateForwardfunction(context, SecondGameScreen());
          } else if (content == "3" && GameMetaData.ThirdGamePlayed) {
            Utils.navigateForwardfunction(
                context, ThirdGameScreen(done: false));
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
