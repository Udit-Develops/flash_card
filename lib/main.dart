import 'package:flutter/material.dart';

void main() => runApp(FlashCard());

class FlashCard extends StatelessWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('FlashCards'),
          backgroundColor: Colors.indigo,
        ),
        body: const SafeArea(
          child: CardPage(),
        ),
      ),
    );
  }
}

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        ' Lets Get Started',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
