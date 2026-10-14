import 'package:flutter/material.dart';

class MyCircleBox extends StatelessWidget {
  const MyCircleBox({
    super.key,
    this.color,
    this.border,
    required this.child,
    this.padding,
    this.boxShadow,
    this.size,
  });

  final Color? color;
  final Border? border;
  final Widget child;
  final double? padding;
  final List<BoxShadow>? boxShadow;

  /// Fixed diameter with the child centered. When null, the circle wraps the child.
  final double? size;

  @override
  Widget build(BuildContext context) {
    Widget current = Padding(
      padding: EdgeInsets.all(padding ?? 0),
      child: child,
    );
    if (size != null) {
      current = SizedBox.square(
        dimension: size,
        child: Center(child: current),
      );
    }
    current = DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: border,
        boxShadow: boxShadow,
      ),
      child: current,
    );
    return current;
  }
}
