import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/theme/my_colors.dart';

final ms = MyStyles();

class MyStyles {
  final _pop = const TextStyle(fontFamily: 'Poppins');

  //pop 400
  late final _pop400 = _pop.copyWith(fontWeight: FontWeight.w400);
  late final _pop12w400 = _pop400.copyWith(fontSize: 12);
  late final pop12w400TextSec = _pop12w400.copyWith(color: mc.textSecond);
  late final pop12w400PinkMain = _pop12w400.copyWith(color: mc.pinkMain);
  late final pop12w400TextPrime = _pop12w400.copyWith(color: mc.textPrime);
  late final _pop13w400 = _pop400.copyWith(fontSize: 13);
  late final pop13w400TextPrime = _pop13w400.copyWith(color: mc.textPrime);
  late final _pop14w400 = _pop400.copyWith(fontSize: 14);
  late final pop14w400PinkMain = _pop14w400.copyWith(color: mc.pinkMain);
  late final pop14w400PinkCream = _pop14w400.copyWith(color: mc.pinkCream);
  late final _pop16w400 = _pop400.copyWith(fontSize: 16);
  late final pop16w400Grey = _pop16w400.copyWith(color: mc.fieldHint);
  late final pop16w400TextPrime = _pop16w400.copyWith(color: mc.textPrime);
  late final pop16w400PinkMain = _pop16w400.copyWith(color: mc.pinkMain);
  late final _pop24w400 = _pop400.copyWith(fontSize: 24);
  late final pop24w400PinkMain = _pop24w400.copyWith(color: mc.pinkMain);

  //pop 500
  late final _pop500 = _pop.copyWith(fontWeight: FontWeight.w500);
  late final _pop12w500 = _pop500.copyWith(fontSize: 12);
  late final pop12w500PinkMain = _pop12w500.copyWith(color: mc.pinkMain);
  late final _pop15w500 = _pop500.copyWith(fontSize: 15);
  late final pop15w500TextPrime = _pop15w500.copyWith(color: mc.textPrime);
  late final pop15w500PinkMain = _pop15w500.copyWith(color: mc.pinkMain);

  // pop 600
  late final _pop600 = _pop.copyWith(fontWeight: FontWeight.w600);
  late final _pop13w600 = _pop600.copyWith(fontSize: 13);
  late final pop13w600PinkMain = _pop13w600.copyWith(color: mc.pinkMain);
  late final _pop14w600 = _pop600.copyWith(fontSize: 14);
  late final pop14w600PinkMain = _pop14w600.copyWith(color: mc.pinkMain);
  late final _pop15w600 = _pop600.copyWith(fontSize: 15);
  late final pop15w600TextPrime = _pop15w600.copyWith(color: mc.textPrime);
  late final pop15w600PinkMain = _pop15w600.copyWith(color: mc.pinkMain);
  late final _pop18w600 = _pop600.copyWith(fontSize: 18);
  late final pop18w600TextPrime = _pop18w600.copyWith(color: mc.textPrime);
  late final _pop20w600 = _pop600.copyWith(fontSize: 20);
  late final pop20w600TextPrime = _pop20w600.copyWith(color: mc.textPrime);
  late final pop20w600PinkMain = _pop20w600.copyWith(color: mc.pinkMain);

  // pop 700
  late final _pop700 = _pop.copyWith(fontWeight: FontWeight.w700);
  late final _pop13w700 = _pop700.copyWith(fontSize: 13);
  late final pop13w700TextPrime = _pop13w700.copyWith(color: mc.textPrime);

  //////////////// LeagueSpartan

  // spart700
  final _spart = const TextStyle(fontFamily: 'LeagueSpartan');
  late final _spart700 = _spart.copyWith(fontWeight: FontWeight.w700);
  late final _spart18w700 = _spart700.copyWith(fontSize: 18);
  late final spart18w700TextPrime = _spart18w700.copyWith(color: mc.textPrime);
}
