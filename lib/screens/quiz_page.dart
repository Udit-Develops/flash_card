import 'package:flash_card/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../quiz_components/mcq.dart';
import '../quiz_components/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: kAppBarTStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuizButton(
              title: 'Physics',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MCQ(
                    dataList: phyData,
                  );
                }));
              },
            ),
            QuizButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MCQ(
                    dataList: chemData,
                  );
                }));
              },
              title: 'Chemistry',
            ),
            QuizButton(
              title: 'Mathematics',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MCQ(
                    dataList: mathData,
                  );
                }));
              },
            ),
            QuizButton(
              title: 'General Knowledge',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MCQ(
                    dataList: gkData,
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuizButton extends StatelessWidget {
  QuizButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Future.delayed(Duration.zero, () async {
          onPressed();
        });
      },
      elevation: 30.0,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color(0xFF51C0E1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: kMinicardTStyle,
          ),
        ),
      ),
    );
  }
}
