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
        dialogTheme: DialogTheme(
          backgroundColor: Colors.blue.shade700,
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        dividerColor: Colors.white,
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
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(height: 0.001, color: Colors.transparent),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.blue.shade600,
        ),
        scaffoldBackgroundColor: Colors.blue.shade700,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
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
