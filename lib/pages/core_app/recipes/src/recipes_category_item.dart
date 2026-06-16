import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeCategoryItem extends StatelessWidget {
  const RecipeCategoryItem({
    super.key,
    required this.categoryText,
    required this.assetLink,
  });
  final String categoryText;
  final String assetLink;

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context);

    final heightWidth = mQ.size.width / 2 - 32 - 16;

    final maxHeightWidth = 260.0;

    Widget img = Container(
      width: heightWidth,
      height: heightWidth,
      constraints: BoxConstraints(
        maxHeight: maxHeightWidth,
        maxWidth: maxHeightWidth,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.white, blurRadius: 1)],
      ),
      child: MyNetworkImage(assetLink),
    );

    Widget current = Column(
      children: [
        img,
        const GapV(8),
        MyText.center(categoryText, ms.pop15w500TextPrime, lines: 3),
      ],
    );

    current = Container(
      width: heightWidth,
      constraints: BoxConstraints(maxWidth: maxHeightWidth),
      child: current,
    );
    //so text length doesn't increase the width of the widget, instead wraps down
    return current;
  }
}
