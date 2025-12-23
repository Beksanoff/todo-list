import 'package:flutter/material.dart';

final themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white, brightness: Brightness.dark),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black, brightness: Brightness.dark),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, color: Colors.white),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white, brightness: Brightness.light),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, color: Colors.black),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);
