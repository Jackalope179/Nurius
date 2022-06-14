import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/ThirdGame/explain1.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.result}) : super(key: key);
  int result = 0;
  @override
  Widget build(BuildContext context) {
    if (result > 15) {
      result = 15;
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "chúc mừng bạn đã hoàn thành trò chơi".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const Text(
                "Số điểm của bạn là:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "$result/15".toUpperCase(),
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {
                  Utils.navigateForwardfunction(
                      context, const ExplainFirstGame3());
                },
                child: Text(
                  'xác nhận'.toUpperCase(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
