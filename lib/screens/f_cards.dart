import 'package:flash_card/utilities/constants.dart';
import 'package:flash_card/custom_widget/bottom_bar.dart';
import 'package:flash_card/local/card_data_list.dart';
import 'package:flash_card/local/flash_card_model.dart';
import 'package:flash_card/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Fcards extends StatefulWidget {
  const Fcards({Key? key}) : super(key: key);

  @override
  State<Fcards> createState() => _FcardsState();
}

class _FcardsState extends State<Fcards> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
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
          children: [
            Expanded(
              child: TextField(
                style: kAppBarTStyle,
                controller: titleController,
                maxLines: 2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Card Title',
                  hintStyle: kAppBarTStyle,
                  hintMaxLines: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 173.7,
            ),
            // GestureDetector(
            //   child: const Icon(Icons.ios_share),
            //   onTap: () {
            //     dataList.add(FlashCardModel(
            //         title: titleController.text, body: bodyController.text));
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (context) => new HomePage()),
            //         (route) => false);
            //   },
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: bodyController,
          keyboardType: TextInputType.multiline,
          maxLines: 55,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your text here',
            hintStyle: kFCardinitialTStyle,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(secondary: Color(0xFF1A99EE)),
        ),
        child: FloatingActionButton(
          onPressed: () {
            dataList.add(FlashCardModel(
                title: titleController.text, body: bodyController.text));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => new HomePage()),
                (route) => false);
          },
          child: Icon(Icons.save),
        ),
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

//TODO: Work on bottomBar Functionality
