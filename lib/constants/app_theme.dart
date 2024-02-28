import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(255, 219, 88, 1.0),
  primaryColor: Colors.green,
  colorScheme: ColorScheme.fromSwatch(accentColor: Colors.green)
      .copyWith(background: Colors.white),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.black),
    headlineLarge: TextStyle(color: Colors.black),
    displayLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    primaryColor: const Color.fromARGB(245, 110, 18, 133),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.grey),
      headlineLarge: TextStyle(color: Colors.grey),
      displayLarge: TextStyle(color: Colors.grey),
      displayMedium: TextStyle(color: Colors.grey),
    ));
