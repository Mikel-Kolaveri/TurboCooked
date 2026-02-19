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
  TextStyle get _pop12w400 => _pop400.copyWith(fontSize: 12);
  TextStyle get pop12w400TextSec => _pop12w400.copyWith(color: mc.textSecond);
  TextStyle get pop12w400PinkMain => _pop12w400.copyWith(color: mc.pinkMain);
  TextStyle get _pop16w400 => _pop400.copyWith(fontSize: 16);
  TextStyle get pop16w400Grey => _pop16w400.copyWith(color: mc.fieldHint);
  TextStyle get pop16w400TextPrime => _pop16w400.copyWith(color: mc.textPrime);
  TextStyle get pop16w400PinkMain => _pop16w400.copyWith(color: mc.pinkMain);

  //pop 500
  TextStyle get _pop500 => _pop.copyWith(fontWeight: FontWeight.w500);
  TextStyle get _pop15w500 => _pop500.copyWith(fontSize: 15);
  TextStyle get pop15w500TextPrime => _pop15w500.copyWith(color: mc.textPrime);

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
  TextStyle get _pop24w400 => _pop400.copyWith(fontSize: 24);
  TextStyle get pop24w400PinkMain => _pop24w400.copyWith(color: mc.pinkMain);

  // pop 700
  TextStyle get _pop700 => _pop.copyWith(fontWeight: FontWeight.w700);
  TextStyle get _pop13w700 => _pop700.copyWith(fontSize: 13);
  TextStyle get pop13w700TextPrime => _pop13w700.copyWith(color: mc.textPrime);
  TextStyle get _pop18w700 => _pop700.copyWith(fontSize: 18);
  TextStyle get pop18w700TextPrime => _pop18w700.copyWith(color: mc.textPrime);

  //////////////// LeagueSpartan

  // spart700

  final _spart = TextStyle(fontFamily: 'LeagueSpartan');
  TextStyle get _spart700 => _spart.copyWith(fontWeight: FontWeight.w700);
  TextStyle get _spart18w700 => _spart700.copyWith(fontSize: 18);
  TextStyle get spart15w700TextPrime =>
      _spart18w700.copyWith(color: mc.textPrime);
}
