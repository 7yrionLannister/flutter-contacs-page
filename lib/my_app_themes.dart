import 'package:flutter/material.dart';

enum APP_THEME {light, dark}

class MyAppThemes {
  static ThemeData appThemeLight() => ThemeData(
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.indigo.shade800,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue.shade200,
      iconTheme: const IconThemeData(
          color: Colors.black
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData appThemeDark() => ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(
      color: Colors.orange,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );
}