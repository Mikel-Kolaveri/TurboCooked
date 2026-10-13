import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/int_extension.dart';
import 'package:recipe_app/pages/core_app/recipe_details/src/recipe_step_item.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/pages/core_app/recipe_details/src/recipe_details_creator_profile.dart';
import 'package:recipe_app/pages/core_app/recipe_details/src/recipe_ingredient_item.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_custom_scrollview.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  const RecipeDetailsPage({super.key, required this.recipe});
  final Recipe recipe;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapTop(size: 24),
        MyText(recipe.name, ms.pop20w600TextPrime),
        const GapV(8),
        _MetaRow(recipe: recipe),
        const GapV(24),
        RecipeDetailsCreatorProfile(
          authorName: recipe.authorName,
          authorAvatarUrl: recipe.authorAvatarUrl,
        ),
        const GapV(32),
        MyText('Details', ms.pop20w600PinkMain),
        const GapV(4),
        MyText(recipe.description, ms.pop12w400TextPrime.copyWith(height: 1.5)),
        const GapV(32),
        MyText('Ingredients', ms.pop20w600PinkMain),
        const GapV(4),
        for (final ingredient in recipe.ingredients)
          RecipeIngredientItem(
            ingredientAmountDescription: ingredient.amount,
            ingredientName: ingredient.name,
          ),
        const GapV(32),
        MyText('Steps', ms.pop20w600PinkMain),
        const GapV(12),
        for (final (i, step) in recipe.steps.indexed) ...[
          RecipeStepItem(index: i, text: step),
          const GapV(16),
        ],
        GapBottom.home(),
      ],
    );
    current = HPadding(16, current);
    current = MyCustomScrollView(
      header: MyNetworkImage(recipe.imageUrl),
      headerHeight: 300,
      children: [current],
    );

    Widget back = CircleAvatar(
      backgroundColor: mc.white.opacityTo(0.85),
      child: BackBtn(),
    );

    current = Stack(
      children: [
        current,
        Positioned(top: 32, left: 16, child: back),
      ],
    );
    return current;
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MySvg(MyAssets.star),
        const GapH(4),
        MyText(recipe.rating.toStringAsFixed(1), ms.pop14w400PinkMain),
        const GapH(16),
        MySvg(MyAssets.clock),
        const GapH(4),
        MyText(recipe.durationMinutes.toCookTime(), ms.pop14w400PinkMain),
        const GapH(16),
        Icon(Icons.people_outline, color: mc.pinkMain, size: 18),
        const GapH(4),
        MyText('${recipe.servings} servings', ms.pop14w400PinkMain),
      ],
    );
  }
}
