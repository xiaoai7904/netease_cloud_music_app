import 'package:flutter/material.dart';

class Utils {
  static Color hex2Color(String code) => new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  static String numFormat(int num) {
    if (num / 10000 < 1) {
      return '$num';
    } else if (num / 100000000 < 1) {
      return '${num ~/ 10000}万';
    } else {
      return '${num ~/ 100000000}亿';
    }
  }
}
