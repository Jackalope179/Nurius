import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/FirstGame/final.dart';

class MilkScreen extends StatefulWidget {
  const MilkScreen({Key? key}) : super(key: key);

  @override
  State<MilkScreen> createState() => _MilkScreenState();
}

class _MilkScreenState extends State<MilkScreen>
    with SingleTickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
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
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFBAD2),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Đã đến lúc cho con uống sữa\n hãy điều chỉnh nhiệt độ hợp lý để rã đông sữa nhé",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
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
                            style: const TextStyle(color: Colors.white),
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
                const SizedBox(
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
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    if (currentTemp == 40) {
                      _showMyDialog(
                          "Bạn chọn đúng rồi 😄",
                          "Nhiệt độ trên là 40 độ, bạn đã chọn đúng rồi, hãy tiếp tục",
                          true);
                    } else {
                      _showMyDialog(
                          "Sai mức nhiệt độ rồi 😔",
                          "Nhiệt độ trên vẫn chưa đúng, chọn lại bạn nhé",
                          false);
                    }
                  },
                  child: const Text("Xác nhận")),
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
                  // var parser = EmojiParser();
                  if (currentTemp >= 5) {
                    currentTemp -= 5;
                  }
                });
              },
              child: const Icon(
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
              child: const Icon(
                FontAwesomeIcons.plus,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String title, String content, bool correct) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.pinkAccent,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                correct ? 'Tiếp tục' : 'Chọn lại',
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                correct
                    ? Utils.navigateForwardfunction(
                        context, const FinalScreen())
                    : Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
