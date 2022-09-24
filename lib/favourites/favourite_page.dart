import 'package:flash_card/custom_widget/mini_card.dart';
import 'package:flash_card/favourites/favourite_card.dart';
import 'package:flash_card/utilities/constants.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: kAppBarTStyle,
        ),
      ),
      body: MiniCard(
        colour: const Color(0xFFE75466),
        title: 'About Us',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FavouriteCard();
          }));
        },
      ),
    );
  }
}
