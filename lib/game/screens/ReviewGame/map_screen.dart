import 'package:flutter/material.dart';
import 'package:nurnius/common/Utils.dart';
import 'package:nurnius/game/screens/ReviewGame/questions_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Stack(children: [
        Image.asset(
          'assets/images/bg_review.jpeg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        buildCircle(0.3, 0.15, "1"),
        buildCircle(0.6, 0.3, "2"),
        buildCircle(0.2, 0.5, "3"),
        buildCircle(0.6, 0.7, "4"),
      ]),
    );
  }

  Widget buildCircle(double top, double left, String content) {
    return Positioned(
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: GestureDetector(
        onTap: () {
          if (content != "1") {
            _showMyDialog();
          } else {
            Utils.navigateForwardfunction(context, const QuestionScreen());
          }
        },
        child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 50,
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 40,
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
