import 'package:flutter/material.dart';

class AppTheme {
  static const textColor = Colors.black87;
  static Color selectedItem = const Color(0xff000000);
  static Color unselectedItem = const Color(0xffFFFFFF);
  static Color lightGrey = const Color(0xffD9D9D9);
  static Color mainColor = const Color(0xff4C9ECD);
  static Color secondaryColor = const Color(0xffF7E2D1);
  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selectedItem,
      unselectedItemColor: unselectedItem,
      backgroundColor: mainColor,
    ),
    canvasColor: mainColor,
  );
}
