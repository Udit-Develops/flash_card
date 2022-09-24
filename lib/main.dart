import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const FlashCard());

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();

  static _FlashCardState of(BuildContext context) =>
      context.findAncestorStateOfType<_FlashCardState>()!;
}

class _FlashCardState extends State<FlashCard> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark().copyWith(colorScheme: ColorScheme.dark()),
      themeMode: _themeMode,
      home: const HomePage(),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
