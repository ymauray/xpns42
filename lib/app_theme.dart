import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData data(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        cardTheme: const CardTheme(
          color: Colors.blue,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(
            color: Colors.white,
            decorationColor: Colors.white,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            decorationColor: Colors.white,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.blue.shade700,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
          ),
        ),
      );
}
