import 'package:flutter/material.dart';

import '../screens/f_cards.dart';
import '../utilities/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(0xFF1A99EE),
      ),
      child: BottomNavigationBar(
        // backgroundColor: Color(0xFF1A99EE),
        iconSize: 30.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_italic,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_underline,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              label: ''),
        ],
        selectedItemColor: Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              if (_selectedIndex == index) {
                setState(() {
                  currentMode = TextMode.bold;
                });
              }
              break;
            case 1:
              if (_selectedIndex == index) {
                setState(() {
                  currentMode = TextMode.italic;
                });
              }
              break;
            case 2:
              if (_selectedIndex == index) {
                setState(() {
                  currentMode = TextMode.underline;
                });
              }
              break;
          }
          setState(
            () {
              _selectedIndex = index;
              currentMode;
              kFCardinitialTStyle.merge(
                getStyle(currentMode),
              );
            },
          );
        },
      ),
    );
  }
}

enum TextMode {
  normal,
  bold,
  italic,
  underline,
}

const normalStyle = TextStyle();
const boldStyle = TextStyle(fontWeight: FontWeight.bold);
const italicStyle = TextStyle(fontStyle: FontStyle.italic);
const underlineStyle = TextStyle(decoration: TextDecoration.underline);

TextStyle getStyle(TextMode mode) {
  switch (mode) {
    case TextMode.bold:
      return boldStyle;
    case TextMode.italic:
      return italicStyle;
    case TextMode.underline:
      return underlineStyle;
    default:
      return normalStyle;
  }
}
