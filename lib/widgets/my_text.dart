import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, this.style, {super.key}) : textAlign = null;
  const MyText.center(this.text, this.style, {super.key})
    : textAlign = TextAlign.center;
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign);
  }
}
