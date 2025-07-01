import 'package:flutter/material.dart';

class AppTheme {
  static const _pastelBlue = Color(0xFFB3E5FC);
  static const _pastelIndigo = Color(0xFF9FA8DA);
  static const _lightBackground = Color(0xFFFFFDF7);
  static const _darkBackground = Color(0xFF303034);

  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _pastelBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: _lightBackground,
        visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: _pastelIndigo,
          unselectedItemColor: Colors.grey,
        ),
      );

  static ThemeData get dark => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _pastelIndigo,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: _darkBackground,
        visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: _pastelBlue,
          unselectedItemColor: Colors.grey,
        ),
      );
}
