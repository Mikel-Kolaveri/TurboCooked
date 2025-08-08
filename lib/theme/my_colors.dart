import 'package:flutter/material.dart';

final mc = MyColors();

class MyColors {
  final Color background = Colors.black;
  final Color textPrime = Colors.white;
  final Color pinkMain = Color(0xFFFD5D69);
  final Color pinkLight = Color(0xFFEC888D);
  final Color pinkCream = Color(0xFFFFC6C9);
  Color get textfieldFill => pinkCream;

  final Color fieldHint = Colors.grey.shade700;
  // final Color test = Color(0xFF1C0F0D);
}
