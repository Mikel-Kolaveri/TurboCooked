import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeStepItem extends StatelessWidget {
  const RecipeStepItem({super.key, required this.index, required this.text});
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    Widget number = MyCircleBox(
      color: mc.pinkMain,
      size: 28,
      child: MyText.center('${index + 1}', ms.pop13w700TextPrime),
    );

    Widget current = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        number,
        const GapH(12),
        Expanded(
          child: MyText(text, ms.pop13w400TextPrime.copyWith(height: 1.5)),
        ),
      ],
    );
    return current;
  }
}
