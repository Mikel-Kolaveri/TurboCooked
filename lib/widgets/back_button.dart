import 'package:flutter/material.dart';
import 'package:recipe_app/constants/my_assets.dart';

enum _Type { custom, pop }

class BackBtn extends StatelessWidget {
  const BackBtn.custom({super.key, required this.onTap}) : _type = _Type.custom;
  const BackBtn({super.key}) : _type = _Type.pop, onTap = null;

  final _Type _type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = Image.asset(MyAssets.back, height: 20);
    current = GestureDetector(
      onTap: _type == _Type.custom ? onTap : () => Navigator.pop(context),
      child: current,
    );

    return current;
  }
}
