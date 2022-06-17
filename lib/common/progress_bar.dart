import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);
  static double mana = 1;
  static bool isPlayed = false;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    if (ProgressBar.mana < 0) {
      ProgressBar.mana = 0;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: 400,
      height: 80,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              'assets/images/milk_bottle.png',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(120)),
            child: SizedBox(
              width: 300,
              height: 35,
              child: Stack(children: [
                LinearProgressIndicator(
                  minHeight: 300,
                  value: ProgressBar.mana,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[400]!),
                  backgroundColor: const Color(0xffD6D6D6),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${(ProgressBar.mana * 100).toInt()}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
