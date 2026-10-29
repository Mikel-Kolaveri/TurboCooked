import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class TrendingSection extends ConsumerWidget {
  const TrendingSection({super.key});

  static const _cardHeight = 300.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget current = MyAsyncView(
      value: ref.watch(trendingRecipesProvider),
      isEmpty: (recipes) => recipes.isEmpty,
      emptyMessage: 'Nothing trending yet',
      onRetry: () => ref.invalidate(trendingRecipesProvider),
      builder: (recipes) => ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const GapH(16),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return SizedBox(
            width: 280,
            child: RecipeCard(
              key: ValueKey(recipe.id),
              recipe: recipe,
              height: _cardHeight,
              onTap: () => context.push(
                Routes.recipeDetails(recipe.id, origin: Routes.home),
              ),
            ),
          );
        },
      ),
    );
    current = SizedBox(height: _cardHeight, child: current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Trending in Community', ms.pop15w500TextPrime)),
        const GapV(12),
        current,
      ],
    );
    return current;
  }
}
