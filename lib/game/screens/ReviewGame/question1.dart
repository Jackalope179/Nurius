import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);
  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  // ignore: non_constant_identifier_names
  var Question = {
    'id': "1",
    'question':
        "Không để đồ chơi treo nôi có dây hoặc ruy-băng dài hơn bao nhiêu cm phía trên nôi?",
    'answer': ["8cm", "18cm", "10cm", "16cm"],
    'correct': "1",
    "correctAnswer": "18cm",
  };
  var choosenAnswer = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 45,
                    ),
                  ),
                ),
                buildQuestion(
                  Question['id'].toString(),
                  Question['question'].toString(),
                  Question['answer'].toString(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(String id, String question, var answer) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.pinkAccent,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xFFF9F6F0),
                    ),
                    child: Text("Review".toUpperCase()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: IconButton(
                        onPressed: () {
                          if (choosenAnswer == 1) {
                            _showCorrectdialog();
                          } else {
                            _showWrongdialog("18cm");
                          }
                        },
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.blue[500],
                          size: 45,
                        )),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFF9F6F0),
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.55,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Câu $id",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          choosenAnswer = 0;
                        });
                      },
                      child: Text(
                        "A. 8cm",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              choosenAnswer == 0 ? Colors.pink : Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          choosenAnswer = 1;
                        });
                      },
                      child: Text(
                        "B. 18cm",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              choosenAnswer == 1 ? Colors.pink : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          choosenAnswer = 2;
                        });
                      },
                      child: Text(
                        "C. 10cm",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              choosenAnswer == 2 ? Colors.pink : Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          choosenAnswer = 3;
                        });
                      },
                      child: Text(
                        "D. 16 cm",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              choosenAnswer == 3 ? Colors.pink : Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showCorrectdialog() async {
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
            "Chúc mừng".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "bạn đã nhận được 10ml sữa".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff000f9a), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Tiếp theo',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showWrongdialog(String answer) async {
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
            "rất tiếc!!! bạn đã trả lời sai".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "đáp án $answer".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff000f9a), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Tiếp theo',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
