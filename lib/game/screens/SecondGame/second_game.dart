import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurnius/game/screens/SecondGame/successful.dart';

class SecondGame extends StatefulWidget {
  const SecondGame({Key? key}) : super(key: key);
  static var answers = [];
  @override
  State<SecondGame> createState() => _SecondGameState();
}

class _SecondGameState extends State<SecondGame> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildItem(0, 0, 'crib', 1, 1, context),
        SecondGame.answers.contains("pillow")
            ? Container()
            : buildItem(0.2, 0.3, 'pillow', 0.4, 0.4, context),
        SecondGame.answers.contains('baby')
            ? Container()
            : buildItem(0.3, 0.2, 'baby', 0.6, 0.6, context),
        SecondGame.answers.contains('remote')
            ? Container()
            : buildItem(0.4, 0.15, 'remote', 0.3, 0.3, context),
        SecondGame.answers.contains('phone')
            ? Container()
            : buildItem(0.4, 0.6, 'phone', 0.3, 0.3, context),
        SecondGame.answers.contains('bear')
            ? Container()
            : buildItem(0.5, 0.6, 'bear', 0.3, 0.3, context),
        Positioned(
          // center
          top: MediaQuery.of(context).size.height * 0.8,
          left: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.height * 0.15),
              primary: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("OK"),
            onPressed: () {
              if (SecondGame.answers.length == 4) {
                setState(() {
                  SecondGame.answers = [];
                });
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SuccessScreen();
                }));
              } else {
                HapticFeedback.heavyImpact();
                setState(() {
                  SecondGame.answers = [];
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildItem(double top, double left, String item, double width,
      double height, BuildContext context) {
    String path = "";
    if (item == 'crib') {
      path = 'assets/images/$item.jpeg';
    } else {
      path = 'assets/images/$item.png';
    }
    return Positioned(
      // center
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: item != "baby"
          ? GestureDetector(
              onTap: () {
                setState(() {
                  SecondGame.answers.add(item);
                });
              },
              child: Image.asset(
                path,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * width,
                height: MediaQuery.of(context).size.height * height,
              ),
            )
          : Image.asset(
              path,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * width,
              height: MediaQuery.of(context).size.height * height,
            ),
    );
  }
}
