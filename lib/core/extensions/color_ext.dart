import 'package:flutter/material.dart';

extension ColorExt on Color {
  String toHexColor() {
    return '#${value.toRadixString(16)}';
  }

  static Color fromHex(String? hexString) {
    if (hexString == null) {
      return Colors.grey[800]!;
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('FF');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
