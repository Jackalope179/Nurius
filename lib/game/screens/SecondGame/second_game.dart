import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/SecondGame/explain.dart';

class SecondGameScreen extends StatefulWidget {
  const SecondGameScreen({Key? key}) : super(key: key);
  static String answer = "";
  static bool isAnswerChoosen = false;

  @override
  State<SecondGameScreen> createState() => _SecondGameScreenState();
}

class _SecondGameScreenState extends State<SecondGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Stack(
        children: [
          buildItem(.1, .4, "mistery", .2, .4, context),
          buildItem(.6, .1, "binhnuoc1", .15, .3, context),
          buildItem(.6, .4, "binhnuoc2", .15, .3, context),
          buildItem(.6, .7, "binhnuoc3", .15, .3, context),
        ],
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
    } else if (SecondGameScreen.answer == item) {
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
            setState(() => SecondGameScreen.answer = "binhnuoc1");
          } else if (item == "binhnuoc2") {
            setState(() => SecondGameScreen.answer = "binhnuoc2");
          } else if (item == "binhnuoc3") {
            setState(() => SecondGameScreen.answer = "binhnuoc3");
          }
        },
        onDoubleTap: () {
          _showMyDialog(item);
          if (item == "binhnuoc1") {
            setState(() {
              SecondGameScreen.answer = "binhnuoc1";
              SecondGameScreen.isAnswerChoosen = true;
            });
          } else if (item == "binhnuoc2") {
            setState(() {
              SecondGameScreen.answer = "binhnuoc2";
              SecondGameScreen.isAnswerChoosen = true;
            });
          } else if (item == "binhnuoc3") {
            setState(() {
              SecondGameScreen.answer = "binhnuoc3";
              SecondGameScreen.isAnswerChoosen = true;
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
          backgroundColor: Colors.pink,
          title: item != "binhnuoc1"
              ? Text('Bạn chọn sai rồi :(')
              : Text('Bạn chọn đúng rồi :)'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                item != "binhnuoc1"
                    ? Text('bạn chọn sai rồi. Hãy chọn lại nhé'.toUpperCase())
                    : Text('Bạn chọn đúng rồi. Cùng xem giải thích nhé'
                        .toUpperCase()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  item != "binhnuoc1" ? Text('Chọn lại') : Text('Giải thích'),
              onPressed: () {
                item != "binhnuoc1"
                    ? Navigator.of(context).pop()
                    : Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                        return ExplainScreenGame2();
                      }));
              },
            ),
          ],
        );
      },
    );
  }
}
