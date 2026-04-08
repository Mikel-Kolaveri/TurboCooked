import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_rich_text.dart';

class RecipeIngredientItem extends StatelessWidget {
  const RecipeIngredientItem({
    super.key,
    required this.ingredientAmountDescription,
    required this.ingredientName,
  });
  final String ingredientAmountDescription;
  final String ingredientName;

  @override
  Widget build(BuildContext context) {
    return MyRichText(
      children: [
        TextSpan(
          text: '• $ingredientAmountDescription ',
          style: ms.pop12w500PinkMain,
          children: [
            TextSpan(text: ingredientName, style: ms.pop12w400TextPrime),
          ],
        ),
      ],
    );
  }
}
