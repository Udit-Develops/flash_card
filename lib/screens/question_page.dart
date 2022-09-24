import 'package:flash_card/screens/quiz_page.dart';
import 'package:flash_card/utilities/constants.dart';
import 'package:flash_card/quiz_components/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuesPage extends StatefulWidget {
  List<QuizBrain> dataList;
  QuesPage({required this.dataList});

  @override
  State<QuesPage> createState() => _QuesPageState();
}

class _QuesPageState extends State<QuesPage> {
  var correctAnswer;
  var userAnswer;
  var radioIndex;
  int index = 0;
  List<Icon> scoreKeeper = [];
  int score = 0;
  String rightAnswer = '';

  void nextQuestion() {
    if (index < widget.dataList.length) {
      print(index);
      index++;
    }
  }

  bool isFinished() {
    if (index >= widget.dataList.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const QuizPage();
      }));
      print('quiz is finished');

      return true;
    } else {
      return false;
    }
  }

  void reset() {
    index = 0;
  }

  void showRightAnswer(userAnswer) {
    correctAnswer = widget.dataList[index].answer;
    setState(() {
      if (userAnswer == null) {
        rightAnswer = 'Please choose an option';
        print(radioIndex);
      } else {
        if (userAnswer != correctAnswer) {
          rightAnswer = 'Correct Answer: $correctAnswer';
          radioIndex = '1';
        } else {
          checkAnswer(radioIndex);
        }
      }
    });
  }

  void checkAnswer(userAnswer) {
    correctAnswer = widget.dataList[index].answer;
    setState(() {
      rightAnswer = '';
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        score++;
      } else {
        // rightAnswer = 'Correct Answer: $correctAnswer';
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      if (isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          style: AlertStyle(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            titleStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            descStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          title: 'You scored',
          // style: ,
          desc: '$score/5',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              color: Colors.cyan,
              width: 120,
              child: Text(
                "Done",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 20),
              ),
            )
          ],
        ).show();
        reset();
        scoreKeeper = [];
        score = 0;
      } else {
        nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xFF1A99EE),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 600.0, maxWidth: 570),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFFFFFFF)
                : Colors.black.withOpacity(0.81),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  color: const Color(0xFF2BADD5),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.dataList[index].question,
                      style: kQuesTStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                RadioListTile(
                  title: Text(
                    widget.dataList[index].c1,
                    style: kAnsTStyle,
                  ),
                  value: widget.dataList[index].c1,
                  groupValue: radioIndex,
                  onChanged: (value) {
                    setState(() {
                      radioIndex = value;
                      print(radioIndex);
                    });
                  },
                ),
                const SizedBox(width: 40.0),
                RadioListTile(
                  title: Text(
                    widget.dataList[index].c2,
                    style: kAnsTStyle,
                  ),
                  value: widget.dataList[index].c2,
                  groupValue: radioIndex,
                  onChanged: (value) {
                    setState(() {
                      radioIndex = value;
                      print(radioIndex);
                    });
                  },
                ),
                const SizedBox(width: 40.0),
                RadioListTile(
                  title: Text(
                    widget.dataList[index].c3,
                    style: kAnsTStyle,
                  ),
                  value: widget.dataList[index].c3,
                  groupValue: radioIndex,
                  onChanged: (value) {
                    setState(() {
                      radioIndex = value;
                      print(radioIndex);
                    });
                  },
                ),
                const SizedBox(width: 40.0),
                RadioListTile(
                  title: Text(
                    widget.dataList[index].c4,
                    style: kAnsTStyle,
                  ),
                  value: widget.dataList[index].c4,
                  groupValue: radioIndex,
                  onChanged: (value) {
                    setState(() {
                      radioIndex = value;
                      print(radioIndex);
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  rightAnswer,
                  style: const TextStyle(color: Colors.green, fontSize: 15.0),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          showRightAnswer(radioIndex);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                          child: Text(
                            "Answer",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          checkAnswer(radioIndex);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: scoreKeeper,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
