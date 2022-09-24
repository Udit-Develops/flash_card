import 'package:flash_card/custom_widget/bottom_bar.dart';
import 'package:flash_card/favourites/favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/utilities/constants.dart';
import '../screens/home_screen.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({Key? key}) : super(key: key);

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
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
        title: const Text(
          'About Us',
          style: kAppBarTStyle,
        ),
      ),
      body: const Text(''),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(secondary: Color(0xFF1A99EE)),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FavouritePage();
            }));
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
