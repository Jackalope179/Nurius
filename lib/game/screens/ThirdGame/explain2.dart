import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/ThirdGame/explain3.dart';

class ExplainSecondGame3 extends StatefulWidget {
  const ExplainSecondGame3({Key? key}) : super(key: key);

  @override
  State<ExplainSecondGame3> createState() => _ExplainSecondGame3State();
}

class _ExplainSecondGame3State extends State<ExplainSecondGame3> {
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
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDD36A4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    // changes position of shadow to only bottom right
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Flex(direction: Axis.horizontal, children: [
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.2,
                                    MediaQuery.of(context).size.height * 0.15),
                                primary: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("Quay lai"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.2,
                                    MediaQuery.of(context).size.height * 0.15),
                                primary: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("Tiếp theo"),
                              onPressed: () {
                                Utils.navigateForwardfunction(
                                    context, const ExplainThirdGame3());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9F6F0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            const Text(
                              "Treo nhiều bức tranh với màu sắc sặc sỡ, hình ảnh sinh động sẽ giúp bé nâng cao được khả năng quan sát và nhận biết màu sắc xung quanh của trẻ",
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
                                        0.6,
                                    child: Image.asset(
                                      "assets/images/mirror1.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: const Text(
                                      "Tủ sát đất sẽ tránh được việc bé bị cụng đầu khi chơi quanh khu vực dưới tủ. Những tủ có ngăn kéo thấp sẽ hạn chế việc bé bị té hoặc tủ đè khi bé níu, kéo ngăn kéo tủ. Bên cạnh đó, có cây xanh sẽ làm tăng thêm khả năng quan sát của bé, giúp bé thấy được sự thay đổi của cây qua từng ngày.",
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
