import 'package:flutter/material.dart';

class BaseTheme {
  static const Color primary = Color.fromRGBO(255, 165, 0, 1);
  static final ThemeData baseTheme = ThemeData(
    primaryColor: primary,
    brightness: Brightness.light,
    fontFamily: 'Raleway',
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 10,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: primary),
  );
}