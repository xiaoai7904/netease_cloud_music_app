import 'package:flutter/material.dart';

class ColorUtils {
  static Color hex2Color(String code) => new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}