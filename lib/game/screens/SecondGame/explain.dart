import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurnius/common/exit_btn.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/third_game_screen.dart';

class ExplainScreenGame2 extends StatefulWidget {
  const ExplainScreenGame2({Key? key}) : super(key: key);

  @override
  State<ExplainScreenGame2> createState() => _ExplainScreenGame2State();
}

class _ExplainScreenGame2State extends State<ExplainScreenGame2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(children: [
              Row(
                children: [
                  const ExitBtn(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * .1,
                    child: Text(
                      "giải thích".toUpperCase(),
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "Roboto"),
                    ),
                  ),
                ],
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
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9F6F0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(children: [
                                  const Text(
                                    "Trước khi đặt em bé của bạn trong bất kỳ cái nôi nào – cho dù nôi mới hay nôi dùng lại; nôi ở nhà bạn hay ở nhà trẻ, nhà họ hàng của bạn – phải đảm bảo rằng:",
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  buildText(
                                      "Các thanh chắn không cách nhau hơn 6cm và không bị lỏng lẻo, nứt vỡ hoặc bị thiếu."),
                                  buildText(
                                      "Không có lỗ hổng để trang trí ở hai đầu nôi, tránh cho các bé có thể bị kẹt vào những chỗ này."),
                                  buildText(
                                      "Không có cạnh sắc nhọn hoặc răng cưa."),
                                  buildText(
                                      "Hai bên có chốt an toàn, và trẻ không thể tự mở chốt."),
                                  buildText(
                                      "Các góc nôi được gắn chặt và không cao quá 1,5 mm."),
                                  buildText(
                                      "Tấm trải vừa khít với nệm (không bao giờ sử dụng tấm trải cho người lớn)."),
                                  buildText(
                                      "Nệm vừa khít với các cạnh của nôi và không có khoảng cách lớn giữa nệm và nôi."),
                                  buildText(
                                      "Nệm vẫn ở nguyên vị trí khi con của bạn đứng trong nôi."),
                                  buildText("Nệm cứng, không mềm."),
                                  buildText(
                                      "Không để đồ chơi mềm, bông, chăn, và gối (gối người lớn, gối ôm hoặc gối vòng giữ trẻ sơ sinh) "),
                                  buildText(
                                      "Không nên sử dụng miếng chắn nôi. Nếu phải dùng miếng chắn nôi, tránh dùng các loại giống như gối và sử dụng các loại để gắn ở phía dưới đầu và bạn cũng có thể mua loại chắn bằng lưới để giữ đầu và chân tay của em bé trong nôi."),
                                  buildText(
                                      "Nếu sử dụng miếng chắn nôi, phải tháo ra khi em bé bắt đầu có khả năng vịn và đứng lên để bé không sử dụng chúng để cố gắng trèo ra khỏi nôi."),
                                  buildText(
                                      "Không để đồ chơi treo nôi có dây hoặc ruy-băng dài hơn 18cm phía trên nôi."),
                                  buildText(
                                      "Đồ chơi treo nôi phải được gỡ bỏ sau khi bé bắt đầu có thể dùng tay và đầu gối đẩy cơ thể lên, hoặc khi bé 5 tháng tuổi, tùy theo thời điểm đến trước vì trẻ có nguy cơ nghẹt thở khi chúng có thể với tới các đồ chơi này"),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.forward),
                              // style: ElevatedButton.styleFrom(
                              //   fixedSize: Size(
                              //       MediaQuery.of(context).size.width * 0.2,
                              //       MediaQuery.of(context).size.height * 0.15),
                              //   primary: Colors.blueAccent,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              // ),
                              // child: const Text("Qua màn"),
                              onPressed: () {
                                Utils.navigateForwardfunction(
                                    context,
                                    ThirdGameScreen(
                                      done: false,
                                      replay: false,
                                    ));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ]),
              ),
            ]),
          ),
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
