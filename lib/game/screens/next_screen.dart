import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/SecondGame/second_game.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  String path = 'assets/images/baby1.png';
  double left = 0;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width * 0.6 - left < 100) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const SecondGameScreen()));
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
            // print("Left $left");
            // print(MediaQuery.of(context).size.width);
          });
        },
        icon: type == 1 ? Icon(Icons.arrow_right) : Icon(Icons.arrow_left));
  }
}
