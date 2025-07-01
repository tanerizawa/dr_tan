import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      );
  static ThemeData get dark => ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      );
}
