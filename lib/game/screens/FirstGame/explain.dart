import 'package:flutter/material.dart';
import 'package:nurnius/game/screens/next_screen.dart';

class ExplainScreen extends StatefulWidget {
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  State<ExplainScreen> createState() => _ExplainScreenState();
}

class _ExplainScreenState extends State<ExplainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F6F0),
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
                style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                              child: Text("Lý do"),
                              onPressed: () {},
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
                              child: Text("Qua màn"),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return NextScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F6F0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.all(10),
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
                            buildText("Không có cạnh sắc nhọn hoặc răng cưa."),
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
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "\u2022  $txt",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
