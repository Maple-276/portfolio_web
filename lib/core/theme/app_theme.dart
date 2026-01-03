import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
  ),
);
