import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/FirstGame/first_game.dart';
import 'package:nurnius/game/screens/next_screen.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  String path = 'assets/images/baby1.png';
  double left = 0;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width - left < 100) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const FirstGame()));
      });
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            top: MediaQuery.of(context).size.height * 0.5,
            // left: MediaQuery.of(context).size.width * 0.1,
            left: left,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createButton(2),
                createButton(1),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget createButton(int type) {
    return IconButton(
        iconSize: 80,
        color: Colors.blue,
        onPressed: () {
          setState(() {
            if (path == 'assets/images/baby1.png') {
              path = 'assets/images/baby2.png';
            } else if (path == 'assets/images/baby2.png') {
              path = 'assets/images/baby3.png';
            } else {
              path = 'assets/images/baby1.png';
            }
            type == 1 ? left += 10 : left -= 10;
          });
        },
        icon: type == 1 ? Icon(Icons.arrow_right) : Icon(Icons.arrow_left));
  }
}
