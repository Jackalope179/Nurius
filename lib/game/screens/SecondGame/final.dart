import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Text(
                  "Giải thích".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFBAD2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 3,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Đối với sữa mẹ trong ngăn đá tủ lạnh",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\u2022 Trước khi sử dụng 1 ngày, mẹ nên cho sữa từ ngăn cấp đông xuống ngăn mát để rã đông nhưng vẫn giữa nhiệt độ tủ lạnh. hoặc mẹ có thể rã đông sữa trong 1 chậu nước, nhưng phải là nước đá lạnh",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\u2022 Khi sữa đã chảy mềm hoàn toàn sang dạng lỏng, lúc đó mẹ cần nhà nhàng lắc để lớp váng sữa nhiều chất béo và phần nước sữa trong được hoà đều với nhau. Sau đó mới thay nước ngâm sữa thành nước ấm nóng để nhiệt độ thích hợp cho con ăn",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Đối với sữa mẹ bảo quản trong ngăn mát tủ lạnh",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\u2022 Mẹ lấy sữa trong tủ lạnh ra và ngâm torng nước ấm 40 độ  cho đến  khi đạt nhiệt độ phù hợp để con ăn. Tuy nhiên, không nên ngâm sữa trong nước quá nóng vì sẽ làm mất vitamin và khoáng chất có trong sữa mẹ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\u2022 Sữa mẹ sau khi đã lấy ra khỏi tủ lạnh không thể cấp đông lại dùng tiếp. Do đó, mẹ chỉ nên lấy đúng lượng vừa ăn mỗi cữ cho con",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    icon: Icon(
                      size: 50,
                      FontAwesomeIcons.forward,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
