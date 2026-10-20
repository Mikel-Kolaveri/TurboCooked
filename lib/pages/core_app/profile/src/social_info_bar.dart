import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class SocialInfoBar extends StatelessWidget {
  const SocialInfoBar({
    super.key,
    required this.recipeCount,
    required this.followingCount,
    required this.followerCount,
  });
  final int recipeCount;
  final int followingCount;
  final int followerCount;

  @override
  Widget build(BuildContext context) {
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
          infoHeader('Recipes', recipeCount),
          divider,
          infoHeader('Following', followingCount),
          divider,
          infoHeader('Followers', followerCount),
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
