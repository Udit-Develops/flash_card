import 'package:flash_card/favourites/favourite_page.dart';
import 'package:flash_card/main.dart';
import 'package:flash_card/utilities/constants.dart';
import 'package:flash_card/local/card_data_list.dart';
import 'package:flash_card/screens/f_cards.dart';
import 'package:flash_card/screens/flash_data_card.dart';
import 'package:flash_card/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/custom_widget/mini_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: kAppBarTStyle),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white.withOpacity(0.95),
        ),
        child: Theme(
          data: Theme.of(context),
          child: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/FlashCardDrawer.png"))),
                  child: const Text(
                    'Flashcards',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.home,
                            size: 25,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: " Home",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.quiz_rounded,
                            size: 25,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: " Quiz",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const QuizPage();
                      }),
                    );
                  },
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.favorite,
                            size: 25.0,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: " Favorites",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const FavouritePage();
                      }),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                  width: 180.0,
                  child: Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                    thickness: 1.50,
                    color: Color(0xFF9C99B2),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.dark_mode,
                            size: 25,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: ' DarkMode',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ),
                  ),
                  onTap: () =>
                      FlashCard.of(context).changeTheme(ThemeMode.dark),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.light_mode,
                            size: 25,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: ' LightMode',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ),
                  ),
                  onTap: () =>
                      FlashCard.of(context).changeTheme(ThemeMode.light),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(secondary: Color(0xFF1A99EE)),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const Fcards();
              }),
            );
          },
          child: const Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return MiniCard(
              title: dataList[index].title,
              colour: dataList[index].color,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FlashDataCard(
                        data: dataList[index],
                        index: index,
                      );
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
