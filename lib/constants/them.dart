import 'package:flutter/material.dart';

class CustomColorTheme {
  static Color primaryColor = Colors.red;
  static Color backgroundColor = Colors.white;
  static Color textColor = Colors.black;
  static Color iconColor = Colors.red;

  static ThemeData buildTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: textColor,
      iconTheme: IconThemeData(color: iconColor),
      textTheme: TextTheme(
        button: TextStyle(color: textColor),
      ),
      colorScheme: ColorScheme(
        primary: primaryColor,
        secondary: primaryColor,
        surface: backgroundColor,
        background: backgroundColor,
        error: Colors.red,
        onPrimary: textColor,
        onSecondary: textColor,
        onSurface: textColor,
        onBackground: textColor,
        onError: textColor,
        brightness: Brightness.light,
      ),
    );
  }
}
