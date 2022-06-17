import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/metadata.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/third_game_screen.dart';

class ExplainThirdGame3 extends StatefulWidget {
  const ExplainThirdGame3({Key? key}) : super(key: key);

  @override
  State<ExplainThirdGame3> createState() => _ExplainThirdGame3State();
}

class _ExplainThirdGame3State extends State<ExplainThirdGame3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: Text(
                "giải thích".toUpperCase(),
                style: const TextStyle(fontSize: 20, fontFamily: "Roboto"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF9F6F0),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Flex(direction: Axis.horizontal, children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(FontAwesomeIcons.backward),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9F6F0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: const Color(0xFF7E7063),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            const Text(
                              "Hãy tham khảo một số lưu ý sau đây để có thể sắp xếp một căn phòng phù hợp cho bé nhé:",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.asset(
                                      "assets/images/bed1.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Giường sát đất sẽ tránh được việc bé bị cụng đầu khi chơi quanh khu vực gần gầm giường, các góc giường được bo tròn sẽ an toàn hơn khi bé vô tình va vào các góc giường.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ])
                          ]),
                        ),
                      ],
                    ),
                  ),
                )),
                IconButton(
                  onPressed: () {
                    GameMetaData.ThirdGamePlayed = true;
                    Utils.navigateForwardfunction(
                        context,
                        ThirdGameScreen(
                          done: true,
                          replay: true,
                        ));
                  },
                  icon: const Icon(FontAwesomeIcons.forward),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildText(String txt) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\u2022  $txt",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
