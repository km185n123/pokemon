import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Colors based on the reference image
  static const Color _primaryLight = Color(0xFF5C9DFF); // Light blueish
  static const Color _primaryDark = Color(0xFF4F5CFF); // Vibrant purple-blue

  static const Color _backgroundLight = Colors.white;
  static const Color _backgroundDark = Color(
    0xFF0F1115,
  ); // Very dark, almost black

  static const Color _surfaceVariantLight = Color(0xFFE0E0E0);
  static const Color _surfaceVariantDark = Color(0xFF2A2D35);

  static const Color _onBackgroundLight = Colors.black;
  static const Color _onBackgroundDark = Colors.white;

  /// Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: _primaryLight,
      surface: _backgroundLight,
      surfaceContainerHighest: _surfaceVariantLight,
      onSurface: _onBackgroundLight,
    ),
    scaffoldBackgroundColor: _backgroundLight,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: _onBackgroundLight,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.grey,
        letterSpacing: 2,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: _onBackgroundLight,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  /// Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryDark,
      surface: _backgroundDark,
      surfaceContainerHighest: _surfaceVariantDark,
      onSurface: _onBackgroundDark,
    ),
    scaffoldBackgroundColor: _backgroundDark,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: _onBackgroundDark,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.white70,
        letterSpacing: 2,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: _onBackgroundDark,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
