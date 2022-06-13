import 'package:flutter/material.dart';

class ThirdGame extends StatefulWidget {
  const ThirdGame({Key? key}) : super(key: key);

  @override
  State<ThirdGame> createState() => _ThirdGameState();
}

class _ThirdGameState extends State<ThirdGame> {
  int pickedItem = 0;
  int selectingAnswer = -1;

  @override
  Widget build(BuildContext context) {
    List<String> itemList = [];
    if (pickedItem == 0) {
      itemList = ['item1', 'item2', 'item3'];
    } else if (pickedItem == 1) {
      itemList[pickedItem - 1] = 'bed$selectingAnswer';
    } else if (pickedItem == 2) {
      itemList[pickedItem - 1] = 'mirror$selectingAnswer';
    } else if (pickedItem == 3) {
      itemList[pickedItem - 1] = 'closet$selectingAnswer';
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
                    buildItem(150, 150, 0.3, 0.05, 'item1', 1),
                    buildItem(100, 100, 0.33, 0.3, 'item2', 2),
                    buildItem(100, 100, 0.25, 0.17, 'item3', 3),
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
    return selectingPanel();
  }

  Widget buildItem(double width, double height, double top, double left,
      String image, int pickedItem_) {
    return Positioned(
      width: width,
      height: height,
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: GestureDetector(
        onTap: () {
          setState(() {
            pickedItem = pickedItem_;
          });
        },
        child: Image.asset(
          'assets/images/$image.png',
        ),
      ),
    );
  }

  Widget selectingPanel() {
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
              'assets/images/bed1.png',
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
              'assets/images/bed2.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
        ),
      ],
    );
  }
}
