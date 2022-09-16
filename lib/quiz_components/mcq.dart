import 'package:flash_card/utilities/constants.dart';
import 'package:flash_card/quiz_components/quiz_brain.dart';
import 'package:flutter/material.dart';

class MCQ extends StatefulWidget {
  List<QuizBrain> dataList;
  MCQ({required this.dataList});
  @override
  State<MCQ> createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A99EE),
      body: Center(
        child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                print("swiped right");
                widget.dataList.removeAt(0);
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                print("swiped left");
              }
            },
            child: ListView.builder(
              itemCount: widget.dataList.length,
              itemBuilder: (context, index) {
                return QuizCard(
                  dataList: widget.dataList[index],
                );
              },
            )),
      ),
    );
  }
}

class QuizCard extends StatefulWidget {
  QuizBrain dataList;
  QuizCard({required this.dataList});
  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 450.0, maxWidth: 450),
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFFFFFFF)
            : Colors.black,
        // color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          QCard(
            onTap: () {},
            cardChild: Text(
              widget.dataList.question,
              style: kQuesTStyle,
            ),
          ),
          const SizedBox(height: 40.0),
          QCard(
            onTap: () {},
            cardChild: Text(
              widget.dataList.c1,
              style: kAnsTStyle,
            ),
          ),
          const SizedBox(width: 40.0),
          QCard(
            onTap: () {},
            cardChild: Text(
              widget.dataList.c2,
              style: kAnsTStyle,
            ),
          ),
          const SizedBox(width: 40.0),
          QCard(
            onTap: () {},
            cardChild: Text(
              widget.dataList.c3,
              style: kAnsTStyle,
            ),
          ),
          const SizedBox(width: 40.0),
          QCard(
            onTap: () {},
            cardChild: Text(
              widget.dataList.c4,
              style: kAnsTStyle,
            ),
          ),
        ]),
      ),
    );
  }
}

class QCard extends StatelessWidget {
  QCard({required this.cardChild, required this.onTap});

  Widget cardChild;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration.zero, () async {
          onTap();
        });
      },
      child: Card(
        color: Color(0xFF2BADD5),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: cardChild,
        ),
      ),
    );
  }
}

//TODO: Add a back button on top left corner
//TODO: Think of a way to show correct answer
