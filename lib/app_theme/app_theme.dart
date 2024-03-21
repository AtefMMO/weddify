import 'package:flutter/material.dart';

class AppTheme {
  static const _textColor = Colors.black87;
  static Color selectedPurble = const Color(0xff36003C);
  static Color unselectedPurble = const Color(0xff89658B);
  static Color lightGrey = const Color(0xffD9D9D9);

  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selectedPurble,
      unselectedItemColor: unselectedPurble,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
