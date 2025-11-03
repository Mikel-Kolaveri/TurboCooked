import 'package:flutter/material.dart';

class MyCircleBox extends StatelessWidget {
  const MyCircleBox({
    super.key,
    this.color,
    this.border,
    required this.child,
    this.padding,
    this.boxShadow,
  });

  final Color? color;
  final Border? border;
  final Widget child;
  final double? padding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: border,
        boxShadow: boxShadow,
      ),
      child: Padding(padding: EdgeInsets.all(padding ?? 0), child: child),
    );
  }
}
