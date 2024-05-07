import 'package:flutter/material.dart';

class AppTheme {
  static const textColor = Colors.black87;
  static Color selectedItem = const Color(0xff000000);
  static Color unselectedItem = const Color(0xffFFFFFF);
  static Color lightGrey = const Color(0xffD9D9D9);
  static Color mainColor = const Color(0xff4C9ECD);
  static Color secondaryColor = Colors.white;
  static Color orangeColor = const Color( 0xffDE6F37);
  static Color blueColor = const Color( 0xff2D549B);
  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selectedItem,
      unselectedItemColor: unselectedItem,
      backgroundColor: Colors.transparent,
    ),
    canvasColor: Colors.transparent,
  );
}
