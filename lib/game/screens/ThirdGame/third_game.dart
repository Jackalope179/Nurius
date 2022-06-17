import 'package:flutter/material.dart';
import 'package:nurnius/common/utils.dart';
import 'package:nurnius/game/screens/ThirdGame/result_screen.dart';

class ThirdGame extends StatefulWidget {
  const ThirdGame({Key? key}) : super(key: key);

  @override
  State<ThirdGame> createState() => _ThirdGameState();
}

class _ThirdGameState extends State<ThirdGame> {
  int pickedItem = 0;
  int selectingAnswer = 0;
  List<String> itemList = ['item1', 'item2', 'item3'];
  int score = 0;

  @override
  void initState() {
    super.initState();
    pickedItem = 0;
    selectingAnswer = 0;
    itemList = ['item1', 'item2', 'item3'];
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (pickedItem == 1) {
      itemList[pickedItem - 1] =
          selectingAnswer != 0 ? 'bed$selectingAnswer' : "item1";
    } else if (pickedItem == 2) {
      itemList[pickedItem - 1] =
          selectingAnswer != 0 ? 'closet$selectingAnswer' : "item2";
    } else if (pickedItem == 3) {
      itemList[pickedItem - 1] =
          selectingAnswer != 0 ? 'mirror$selectingAnswer' : "item3";
    }

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/empty_room.png',
                      fit: BoxFit.fill,
                    ),
                    buildItem(150, 150, 0.3, 0.05, itemList[0], 1),
                    buildItem(100, 100, 0.33, 0.3, itemList[1], 2),
                    buildItem(100, 100, 0.25, 0.17, itemList[2], 3),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.005,
                      left: MediaQuery.of(context).size.width * 0.4,
                      child: !(itemList.contains("item1") ||
                              itemList.contains("item2") ||
                              itemList.contains("item3"))
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                fixedSize: const Size(150, 50),
                              ),
                              onPressed: () {
                                Utils.navigateForwardfunction(
                                    context,
                                    ResultScreen(
                                      result: validateAnswer() * 5,
                                    ));
                              },
                              child: Text(
                                'xác nhận'.toUpperCase(),
                              ),
                            )
                          : Container(),
                    )
                  ],
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.8,
              child: buildRightPanel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRightPanel() {
    return pickedItem == 0 ? startingPanel() : selectingPanel();
  }

  Widget startingPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Hãy chọn các vật dụng trong phòng sao cho phù hợp nhất",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Bấm vào từng đồ vật trong phòng để lựa chọn bạn nhé",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(double width, double height, double top, double left,
      String image, int pickedItem_) {
    if (image == "mirror1") {
      top = 0.15;
      left = 0.2;
    } else if (image == "mirror2") {
      top = 0.1;
      left = 0.075;
    }
    return Positioned(
      width: width,
      height: height,
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: GestureDetector(
        onTap: () {
          setState(() {
            pickedItem = pickedItem_;
            selectingAnswer = 0;
          });
        },
        child: Image.asset(
          'assets/images/$image.png',
        ),
      ),
    );
  }

  Widget selectingPanel() {
    // 0.15, 0.2
    String item_ = "bed";
    if (pickedItem == 1) {
      item_ = "bed";
    } else if (pickedItem == 2) {
      item_ = "closet";
    } else if (pickedItem == 3) {
      item_ = "mirror";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectingAnswer = 1;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectingAnswer == 1
                    ? Colors.blue[400]!
                    : Colors.pink[400]!,
                width: 2,
              ),
            ),
            child: Image.asset(
              'assets/images/${item_}1.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectingAnswer = 2;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink[100],
              border: Border.all(
                color: selectingAnswer == 2
                    ? Colors.blue[400]!
                    : Colors.pink[400]!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/${item_}2.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
        ),
      ],
    );
  }

  int validateAnswer() {
    if (itemList[0] == "bed1") score += 1;
    if (itemList[1] == "closet1") score += 1;
    if (itemList[2] == "mirror1") score += 1;
    return score;
  }
}
