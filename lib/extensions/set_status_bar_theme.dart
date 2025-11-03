import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/theme/my_colors.dart';

void setMyStatusBarStyle(BuildContext context) {
  SystemUiOverlayStyle systemOverlayStyleForBrightness(
    Brightness brightness, [
    Color? backgroundColor,
  ]) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }

  final SystemUiOverlayStyle overlayStyle = systemOverlayStyleForBrightness(
    ThemeData.estimateBrightnessForColor(mc.bgAuth),
  );

  SystemChrome.setSystemUIOverlayStyle(overlayStyle);
}
