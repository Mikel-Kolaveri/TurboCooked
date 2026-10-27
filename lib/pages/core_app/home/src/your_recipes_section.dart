import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class YourRecipes extends ConsumerWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget current = MyAsyncView(
      value: ref.watch(savedRecipesProvider),
      isEmpty: (recipes) => recipes.isEmpty,
      emptyMessage: 'No favorites yet',
      onRetry: () => ref.invalidate(savedRecipesProvider),
      color: mc.white,
      builder: (recipes) => ListView.separated(
        itemBuilder: (context, index) => RecipeItem.home(
          key: ValueKey(recipes[index].id),
          recipe: recipes[index],
          isFavorite: true,
        ),
        separatorBuilder: (context, index) => GapH(16),
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        padding: EdgeInsets.symmetric(horizontal: 32),
      ),
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
