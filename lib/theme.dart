import 'package:flutter/material.dart';

class CustomTheme {
  static const darkBackgroundColor = Colors.black;
  static const darkPrimaryColor = Colors.white;
  static const darkAccentColor = Colors.white60;

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: darkPrimaryColor,
      backgroundColor: darkBackgroundColor,
      hoverColor: darkBackgroundColor.withOpacity(0.2),
      iconTheme: const IconThemeData(
        color: darkPrimaryColor,
        size: 35,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: darkPrimaryColor,
        displayColor: darkPrimaryColor,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: darkAccentColor),
    );
  }

  static const lightBackgroundColor = Colors.lightBlue;
  static const lightPrimaryColor = Colors.white;
  static const lightAccentColor = Colors.white60;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: lightPrimaryColor,
      backgroundColor: lightBackgroundColor,
      hoverColor: lightBackgroundColor.withOpacity(0.2),
      iconTheme: const IconThemeData(
        color: lightPrimaryColor,
        size: 35,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: lightPrimaryColor,
        displayColor: lightPrimaryColor,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: lightAccentColor),
    );
  }
}
