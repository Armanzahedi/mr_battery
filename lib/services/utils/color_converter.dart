import 'dart:ui';
import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ToMaterialColor on Color {
  MaterialColor toMaterialColor() {
    var colors = Map<int, Color>();
    for (var i = 1; i >= 10; i++) {
      int range;
      if (i == 1) {
        range = 50;
      } else {
        range = i * 100 - 100;
      }
      colors[range] = Color.fromRGBO(this.red, this.green, this.blue, i / 10);
    }
    return MaterialColor(this.hashCode, colors);
  }
}
