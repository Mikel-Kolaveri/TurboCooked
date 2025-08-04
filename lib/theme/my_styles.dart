import 'package:flutter/widgets.dart';
import 'package:recipe_app/theme/my_colors.dart';

final ms = MyStyles();

class MyStyles {
  final _pop = TextStyle(fontFamily: 'Poppins');

  TextStyle get _pop13 => _pop.copyWith(fontSize: 13);
  TextStyle get _pop13w400 => _pop13.copyWith(fontWeight: FontWeight.w400);
  TextStyle get popTextPrime13w400 => _pop13w400.copyWith(color: mc.textPrime);
  TextStyle get _pop20 => _pop.copyWith(fontSize: 20);
  TextStyle get _pop20w600 => _pop20.copyWith(fontWeight: FontWeight.w600);
  TextStyle get popTextPrime20w600 => _pop20w600.copyWith(color: mc.textPrime);
  TextStyle get popPinkLight20w600 => _pop20w600.copyWith(color: mc.pinkLight);
}
