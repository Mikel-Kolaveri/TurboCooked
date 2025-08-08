import 'package:flutter/material.dart';

class UnFocus extends StatelessWidget {
  const UnFocus(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
