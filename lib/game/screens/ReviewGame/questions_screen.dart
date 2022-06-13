import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestion = 0;
  var listQuestion = [
    {
      'id': "1",
      'question':
          "Không để đồ chơi treo nôi có dây hoặc ruy-băng dài hơn bao nhiêu cm phía trên nôi?",
      'answer': ["8cm", "18cm", "10cm", "16cm"],
      'correct': "1",
      "correctAnswer": "18cm",
    },
    {
      'id': "2",
      'question':
          "Khi rã đông sữa lấy ra từ tủ lạnh, cha mẹ nên ngâm trong nước ấm bao nhiêu độ?",
      'answer': ["45cm", "35cm", "40cm", "20cm"],
      'correct': "2",
      "correctAnswer": "40cm",
    },
    {
      'id': "3",
      'question':
          "Các góc cạnh của đồ vật trong nhà nên là góc gì để có thể đảm bảo an toàn cho bé?",
      'answer': ["Vuông", "Lục giác", "Tròn", "Tam giác"],
      'correct': "2",
      "correctAnswer": "Tròn",
    },
  ];
  var choosenAnswer = [-1, -1, -1];
  int totalCorrect = 0;
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
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: IconButton(
                    onPressed: () {
                      if (currentQuestion > 0) {
                        setState(() {
                          currentQuestion--;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(
                      FontAwesomeIcons.backward,
                      size: 45,
                    ),
                  ),
                ),
                buildQuestion(
                    listQuestion[currentQuestion]['id'].toString(),
                    listQuestion[currentQuestion]['question'].toString(),
                    listQuestion[currentQuestion]['answer']),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: IconButton(
                    onPressed: () {
                      if (currentQuestion < listQuestion.length) {
                        if (choosenAnswer[currentQuestion].toString() !=
                            listQuestion[currentQuestion]["correct"]) {
                          _showWrongdialog(listQuestion[currentQuestion]
                                  ["correctAnswer"]
                              .toString());
                        } else {
                          _showCorrectdialog();
                        }
                      } else {}
                    },
                    icon: const Icon(
                      FontAwesomeIcons.forward,
                      size: 45,
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

  Widget buildQuestion(String id, String question, var answer) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.pinkAccent,
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.75,
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color(0xFFF9F6F0),
        ),
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.6,
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
                      choosenAnswer[currentQuestion] = 0;
                    });
                  },
                  child: Text(
                    "A. ${answer[0]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (currentQuestion + 1).toString() == id &&
                              choosenAnswer[currentQuestion] == 0
                          ? Colors.pink
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      choosenAnswer[currentQuestion] = 1;
                    });
                  },
                  child: Text(
                    "B. ${answer[1]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (currentQuestion + 1).toString() == id &&
                              choosenAnswer[currentQuestion] == 1
                          ? Colors.pink
                          : Colors.black,
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
                      choosenAnswer[currentQuestion] = 2;
                    });
                  },
                  child: Text(
                    "C. ${answer[2]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (currentQuestion + 1).toString() == id &&
                              choosenAnswer[currentQuestion] == 2
                          ? Colors.pink
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      choosenAnswer[currentQuestion] = 3;
                    });
                  },
                  child: Text(
                    "D. ${answer[3]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (currentQuestion + 1).toString() == id &&
                              choosenAnswer[currentQuestion] == 3
                          ? Colors.pink
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
                setState(() {
                  currentQuestion++;
                  totalCorrect++;
                });
                if (currentQuestion == listQuestion.length - 1) {
                  _showResult(totalCorrect);
                }
                Navigator.of(context).pop();
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
                setState(() {
                  currentQuestion++;
                });
                if (currentQuestion == listQuestion.length - 1) {
                  _showResult(totalCorrect);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showResult(int correctAnswer) async {
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
            "kết quả".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "bạn trả lời đúng $correctAnswer/3 câu hỏi".toUpperCase(),
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
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
              },
            ),
          ],
        );
      },
    );
  }
}
