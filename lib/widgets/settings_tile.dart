import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showArrow = true,
  });

  final IconData? icon;
  final String title;
  final VoidCallback? onTap;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    Widget iconBox = MyCircleBox(
      color: mc.pinkMain,
      padding: 10,
      child: Icon(icon, color: mc.white, size: 20),
    );

    Widget current = Row(
      children: [
        iconBox,
        const SizedBox(width: 16),
        Expanded(child: MyText(title, ms.pop16w400TextPrime)),
        if (showArrow) Icon(Icons.chevron_right, color: mc.pinkMain, size: 20),
      ],
    );
    current = SymPadding(h: 0, v: 12, child: current);
    current = GestureDetector(onTap: onTap, child: current);

    return current;
  }
}
