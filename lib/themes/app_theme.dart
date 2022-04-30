import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.light().copyWith(
    primaryColor: Color(0xFF0A235E),
    backgroundColor: Colors.grey[300],
    scaffoldBackgroundColor: Color(0xFFF2F7FF),
    cardColor: Color(0xFFFEFFFF),
  );
}
