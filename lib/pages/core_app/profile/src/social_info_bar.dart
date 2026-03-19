import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class SocialInfoBar extends ConsumerWidget {
  const SocialInfoBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget infoHeader(String text, int value) {
      return Expanded(
        child: Column(
          children: [
            MyText.center(text, ms.pop15w600TextPrime),
            MyText.center(value.toString(), ms.pop12w400TextPrime),
          ],
        ),
      );
    }

    final divider = VerticalDivider(
      color: mc.pinkCream,
      thickness: 1.5,
      indent: 4,
      endIndent: 4,
    );

    Widget current = IntrinsicHeight(
      child: Row(
        children: [
          infoHeader('Recipes', 20),
          divider,
          infoHeader('Following', 180),
          divider,
          infoHeader('Followers', 200),
        ],
      ),
    );
    current = VPadding(8, current);
    current = HPadding(4, current);

    current = DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: mc.pinkCream),
        borderRadius: BorderRadius.circular(12),
      ),
      child: current,
    );

    return current;
  }
}
