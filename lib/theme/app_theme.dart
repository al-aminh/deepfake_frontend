import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: const Color(0xFF5B22B7),
    );
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF7F7FA),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: const Color(0xFFF7F7FA),
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: const Color(0xFF5B22B7),
    );
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF050A12),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: const Color(0xFF050A12),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
