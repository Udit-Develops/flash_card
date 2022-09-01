import 'package:flash_card/constants.dart';
import 'package:flash_card/custom_widget/bottom_bar.dart';
import 'package:flash_card/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Fcards extends StatefulWidget {
  const Fcards({Key? key}) : super(key: key);

  @override
  State<Fcards> createState() => _FcardsState();
}

class _FcardsState extends State<Fcards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Color(0xFF000000),
                    ),
                    SizedBox(width: 7),
                    Text("Favourite"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Color(0xFF000000),
                    ),
                    SizedBox(width: 7),
                    Text("Delete")
                  ],
                ),
              ),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ],
        title: Row(
          children: const [
            Text(
              'Card 2',
              style: kAppBarTStyle,
            ),
            SizedBox(
              width: 173.7,
            ),
            Icon(Icons.ios_share)
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your text here',
                hintStyle: kFCardinitialTStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
      break;
    case 1:
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      break;
  }
}
