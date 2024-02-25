import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static Color selectedPurble=Color(0xff36003C);
  static Color unselectedPurble=Color(0xff89658B);
  static Color lightGrey = Color(0xffD9D9D9);
  static ThemeData appTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  selectedItemColor: selectedPurble,
  unselectedItemColor: unselectedPurble,
  backgroundColor: Colors.transparent,
  elevation: 0));
}