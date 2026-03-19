import 'package:flutter/material.dart';

final mc = MyColors();

class MyColors {
  final Color black = Colors.black;
  final Color white = Colors.white;

  final Color bg = Color(0xFF130c0b);
  final Color bgAuth = Colors.black;

  final Color textPrime = Colors.white;
  final Color textSecond = Colors.black;
  final Color pinkMain = Color(0xFFFD5D69);
  // final Color roseRed = Color(0xFFFA003F);
  final Color pinkLight = Color(0xFFEC888D);
  final Color pinkCream = Color(0xFFFFC6C9);
  Color get textfieldFill => pinkCream;

  final Color fieldHint = Colors.grey.shade700;
}
