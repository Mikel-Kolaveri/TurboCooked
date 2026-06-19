import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/my_text.dart';
part 'your_recipes_item.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleRecipes = RecipeData.categories
        .expand((c) => c.recipes)
        .take(2)
        .toList();
    final testChildren = [
      RecipeItem.home(recipe: sampleRecipes[0], isFavorite: true),
      RecipeItem.home(recipe: sampleRecipes[1]),
    ];

    Widget current = ListView.separated(
      itemBuilder: (context, index) => testChildren[index],
      separatorBuilder: (context, index) => GapH(16),
      scrollDirection: Axis.horizontal,
      itemCount: testChildren.length,
      padding: EdgeInsets.symmetric(horizontal: 32),
    );

    current = SizedBox(height: 184, child: current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Favorite Recipes', ms.pop15w500TextPrime)),
        const GapV(16),
        current,
      ],
    );
    current = Container(
      padding: EdgeInsets.only(top: 16, bottom: 16 + 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: mc.pinkMain,
      ),
      child: current,
    );
    return current;
  }
}
