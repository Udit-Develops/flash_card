import 'package:flash_card/local/flash_card_model.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../custom_widget/bottom_bar.dart';
import '../local/card_data_list.dart';
import 'home_screen.dart';

class FlashDataCard extends StatelessWidget {
  FlashCardModel data;
  int index;
  FlashDataCard({Key? key, required this.data, required this.index})
      : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = data.title;
    bodyController.text = data.body;
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
            onSelected: (item) => SelectedItem(context, item, index),
          ),
        ],
        title: Row(
          children: [
            Expanded(
              child: TextFormField(
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
        child: TextFormField(
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

void SelectedItem(BuildContext context, item, int index) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
      break;
    case 1:
      dataList.removeAt(index);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      break;
  }
}
