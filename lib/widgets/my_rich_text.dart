import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({super.key, required this.children, required this.style})
    : isCentered = false;
  const MyRichText.center({
    super.key,
    required this.children,
    required this.style,
  }) : isCentered = true;
  final List<InlineSpan> children;
  final TextStyle style;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      text: TextSpan(style: style, children: children),
    );
  }
}
