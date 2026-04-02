import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, this.style, {super.key, this.lines, this.onTap})
    : textAlign = null;
  const MyText.center(
    this.text,
    this.style, {
    super.key,
    this.lines,
    this.onTap,
  }) : textAlign = TextAlign.center;
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: lines,
      overflow: lines != null ? TextOverflow.ellipsis : null,
    );
    if (onTap != null) current = GestureDetector(onTap: onTap, child: current);
    return current;
  }
}
