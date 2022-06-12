import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/game/screens/SecondGame/final.dart';

class MilkScreen extends StatefulWidget {
  const MilkScreen({Key? key}) : super(key: key);

  @override
  State<MilkScreen> createState() => _MilkScreenState();
}

class _MilkScreenState extends State<MilkScreen>
    with SingleTickerProviderStateMixin {
  var _animationController;
  double currentPos = 0.0;
  int currentTemp = 0;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Đã đến lúc cho con uống sữa rồi , hãy điều chỉnh nhiệt độ hợp lý để rã đông sữa nhé",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.pink,
                          child: Text(
                            '$currentTemp',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset(
                          "assets/images/radong.png",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                buildSlider(),
              ]),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                        MediaQuery.of(context).size.height * 0.15),
                    primary: Colors.pink,
                    onSurface: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FinalScreen(),
                      ),
                    );
                  },
                  child: Text("Xác nhận")),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "minus",
              onPressed: () {
                if (currentPos >= 0.05) {
                  currentPos -= 0.05;
                }
                _animationController.animateTo(currentPos);
                setState(() {
                  if (currentTemp >= 5) {
                    currentTemp -= 5;
                  }
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
              ),
            ),
            FloatingActionButton(
              heroTag: "plus",
              onPressed: () {
                if (currentPos <= 0.95) {
                  currentPos += 0.05;
                }
                _animationController.animateTo(currentPos);
                setState(() {
                  if (currentTemp <= 95) {
                    currentTemp += 5;
                  }
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 10,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.1),
              gradient: const LinearGradient(colors: [
                Colors.blue,
                Colors.blueAccent,
                Colors.lightBlueAccent,
                Colors.redAccent,
                Colors.red
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, __) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    trackHeight: 0.5,
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withAlpha(1),
                  ),
                  child: Slider(
                    value: _animationController.value,
                    onChanged: (double a) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
