import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/game/screens/SecondGame/milk.dart';

class ExplainScreenGame2 extends StatefulWidget {
  const ExplainScreenGame2({Key? key}) : super(key: key);

  @override
  State<ExplainScreenGame2> createState() => _ExplainScreenGame2State();
}

class _ExplainScreenGame2State extends State<ExplainScreenGame2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFDD36A4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        // changes position of shadow to only bottom right
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: const [
                            Text(
                              "Dụng cụ trữ sữa là một trong những yếu tố ảnh hưởng tới các bảo quản sữa mẹ tốt nhất. Chỉ nên đựng sữa vào những dụng cụ trữ sửa dưới đây :",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Bình trữ sữa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "\u2022 Để trữ sữa, mẹ có thể sử dụng bình nhựa hoặc bình thuỷ tinh. Trước khi sử dụng, nên vệ sinh bình sữa bằng nước ấm và để ráo. Khi cho sửa vào bình không nên đổ đầy mà hãy để lại một khoảng trống, không trữ sữa trong bình mẻ, nứt",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Túi trữ sữa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "\u2022 Các mẹ có thể mua túi trữ sữa chuyên dụng của các thương hiệu uy tín với dung tích khoảng 60 -120ml để bảo quản sữa mẹ. Khi để sữa vào túi tránh đổ quá đầy, nên để lại không gian vì sữa là chất lỏng nên sẽ giản nở khi đông lại",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ]),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MilkScreen(),
                      ));
                    },
                    icon: Icon(
                      FontAwesomeIcons.forward,
                      size: 40,
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
