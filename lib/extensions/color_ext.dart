import 'package:flutter/material.dart';

extension ColorOpacityExtension on Color {
  Color opacityTo(double opacity) {
    assert(opacity >= 0 && opacity <= 1);
    return withValues(alpha: opacity);
  }
}
