import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/theme/my_colors.dart';

final ms = MyStyles();

class MyStyles {
  final _pop = TextStyle(fontFamily: 'Poppins');

  //pop 400
  TextStyle get _pop400 => _pop.copyWith(fontWeight: FontWeight.w400);
  TextStyle get _pop13w400 => _pop400.copyWith(fontSize: 13);
  TextStyle get pop13w400TextPrime => _pop13w400.copyWith(color: mc.textPrime);
  TextStyle get _pop16w400 => _pop400.copyWith(fontSize: 16);
  TextStyle get pop16w400Grey => _pop16w400.copyWith(color: mc.fieldHint);

  // pop 600
  TextStyle get _pop600 => _pop.copyWith(fontWeight: FontWeight.w600);
  TextStyle get _pop13w600 => _pop600.copyWith(fontSize: 13);
  TextStyle get pop13w600PinkMain => _pop13w600.copyWith(color: mc.pinkMain);
  TextStyle get _pop14w600 => _pop600.copyWith(fontSize: 14);
  TextStyle get pop14w600PinkMain => _pop14w600.copyWith(color: mc.pinkMain);
  TextStyle get _pop15w600 => _pop600.copyWith(fontSize: 15);
  TextStyle get pop15w600TextPrime => _pop15w600.copyWith(color: mc.textPrime);
  TextStyle get _pop20w600 => _pop600.copyWith(fontSize: 20);
  TextStyle get pop20w600TextPrime => _pop20w600.copyWith(color: mc.textPrime);
  TextStyle get pop20w600PinkMain => _pop20w600.copyWith(color: mc.pinkMain);
}
