import 'package:flash_card/utilities/constants.dart';
import 'package:flash_card/custom_widget/bottom_bar.dart';
import 'package:flash_card/local/card_data_list.dart';
import 'package:flash_card/local/flash_card_model.dart';
import 'package:flash_card/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Fcards extends StatefulWidget {
  const Fcards({Key? key}) : super(key: key);

  @override
  State<Fcards> createState() => _FcardsState();
}

TextMode currentMode = TextMode.normal;

class _FcardsState extends State<Fcards> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Color selectedColor = Color(0xFFE75466);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ColorPicker(
                              pickerColor: Colors.red, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                selectedColor = color;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 8),
                                  child: Text("Done"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    const SizedBox(width: 7),
                    const Text("Favourite"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    const SizedBox(width: 7),
                    const Text("Delete")
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
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: bodyController,
          keyboardType: TextInputType.multiline,
          maxLines: 55,
          style: kFCardinitialTStyle.merge(
            getStyle(currentMode),
          ),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your text here',
              hintStyle: kFCardinitialTStyle),
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(secondary: Color(0xFF1A99EE)),
        ),
        child: FloatingActionButton(
          onPressed: () {
            dataList.add(FlashCardModel(
                title: titleController.text,
                body: bodyController.text,
                color: selectedColor));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => new HomePage()),
                (route) => false);
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
      break;
    case 1:
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      break;
  }
}
