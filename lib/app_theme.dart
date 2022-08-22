import 'package:flutter/material.dart';

class AppTheme {
  get ThemeData data => ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xff87a556),
      secondary: Colors.blueGrey,
      surface: Colors.blueGrey,
      background: Colors.blueGrey,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
  );
}
