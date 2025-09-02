import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, this.style, {super.key, this.onTap})
    : textAlign = null;
  const MyText.center(this.text, this.style, {super.key, this.onTap})
    : textAlign = TextAlign.center;
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(text, style: style, textAlign: textAlign);
    if (onTap != null) current = GestureDetector(onTap: onTap, child: current);
    return current;
  }
}
