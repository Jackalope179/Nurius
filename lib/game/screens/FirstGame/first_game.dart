import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/FirstGame/successful.dart';

class FirstGame extends StatefulWidget {
  const FirstGame({Key? key}) : super(key: key);
  static var answers = [];
  @override
  State<FirstGame> createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          buildItem(0, 0, 'crib', 1, 1, context),
          FirstGame.answers.contains("pillow")
              ? Container()
              : buildItem(0.2, 0.3, 'pillow', 0.4, 0.4, context),
          FirstGame.answers.contains('baby')
              ? Container()
              : buildItem(0.3, 0.2, 'baby', 0.6, 0.6, context),
          FirstGame.answers.contains('remote')
              ? Container()
              : buildItem(0.4, 0.15, 'remote', 0.3, 0.3, context),
          FirstGame.answers.contains('phone')
              ? Container()
              : buildItem(0.4, 0.6, 'phone', 0.3, 0.3, context),
          FirstGame.answers.contains('bear')
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
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("OK"),
              onPressed: () {
                if (FirstGame.answers.contains("bear") &&
                    FirstGame.answers.length == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SuccessScreen();
                  }));
                }
              },
            ),
          ),
        ],
      ),
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
                  FirstGame.answers.add(item);
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
