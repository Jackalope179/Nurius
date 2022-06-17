import 'package:flutter/material.dart';
import 'package:nurnius/common/bulb_btn.dart';
import 'package:nurnius/common/exit_btn.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/FirstGame/explain.dart';

class FirstGame extends StatefulWidget {
  const FirstGame({Key? key}) : super(key: key);
  static String answer = "";
  static bool isAnswerChoosen = false;

  @override
  State<FirstGame> createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        body: Stack(
          children: [
            ExitBtn(),
            // BulbBtn(
            //     msg:
            //         "Bố mẹ hãy nhấn 2 lần vào vật dụng đúng \nđể bảo quản sữa mới được hút ra nhé"),
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFBAD2),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Bố mẹ hãy nhấn 2 lần vào vật dụng đúng \nđể bảo quản sữa mới được hút ra nhé",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      // unserline
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            buildItem(.2, .4, "mistery", .2, .4, context),
            buildItem(.6, .1, "binhnuoc1", .15, .3, context),
            buildItem(.6, .4, "binhnuoc2", .15, .3, context),
            buildItem(.6, .7, "binhnuoc3", .15, .3, context),
          ],
        ),
      ),
    );
  }

  Widget buildItem(double top, double left, String item, double width,
      double height, BuildContext context) {
    String path = 'assets/images/$item.png';
    Color color;
    double borderWidth;
    if (item == "mistery") {
      color = Colors.transparent;
      borderWidth = 0;
    } else if (FirstGame.answer == item) {
      color = Colors.green;
      borderWidth = 3.5;
    } else {
      color = Colors.pink;
      borderWidth = 3.5;
    }
    return Positioned(
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: GestureDetector(
        onTap: () {
          if (item == "binhnuoc1") {
            setState(() => FirstGame.answer = "binhnuoc1");
          } else if (item == "binhnuoc2") {
            setState(() => FirstGame.answer = "binhnuoc2");
          } else if (item == "binhnuoc3") {
            setState(() => FirstGame.answer = "binhnuoc3");
          }
        },
        onDoubleTap: () {
          _showMyDialog(item);
          if (item == "binhnuoc1") {
            setState(() {
              FirstGame.answer = "binhnuoc1";
              FirstGame.isAnswerChoosen = true;
            });
          } else if (item == "binhnuoc2") {
            setState(() {
              FirstGame.answer = "binhnuoc2";
              FirstGame.isAnswerChoosen = true;
            });
          } else if (item == "binhnuoc3") {
            setState(() {
              FirstGame.answer = "binhnuoc3";
              FirstGame.isAnswerChoosen = true;
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color, width: borderWidth),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            path,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * width,
            height: MediaQuery.of(context).size.height * height,
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String item) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.pinkAccent,
          title: item != "binhnuoc1"
              ? const Text(
                  'Bạn chọn sai rồi 😔',
                  style: TextStyle(color: Colors.white),
                )
              : const Text(
                  'Bạn chọn đúng rồi 😄',
                  style: TextStyle(color: Colors.white),
                ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                item != "binhnuoc1"
                    ? const Text(
                        'Bạn chọn sai rồi. Hãy chọn lại nhé',
                        style: TextStyle(color: Colors.black),
                      )
                    : const Text(
                        'Bạn chọn đúng rồi. Cùng xem giải thích nhé !',
                        style: TextStyle(color: Colors.black),
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
            TextButton(
              child: item != "binhnuoc1"
                  ? const Text(
                      'Chọn lại',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Giải thích',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
              onPressed: () {
                item != "binhnuoc1"
                    ? Navigator.of(context).pop()
                    : Utils.navigateForwardfunction(
                        context, const ExplainScreenGame1());
              },
            ),
          ],
        );
      },
    );
  }
}
