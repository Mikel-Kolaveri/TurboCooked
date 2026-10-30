import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class CategoryRecipesListPage extends ConsumerWidget {
  const CategoryRecipesListPage({super.key, required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Not whenData: it drops the previous value while the categories reload,
    // so the list would flash a spinner and the title would go blank.
    final categories = ref.watch(categoriesProvider);
    final category = categories.valueOrNull
        ?.where((c) => c.id == categoryId)
        .firstOrNull;

    Widget recipes = MyAsyncView(
      value: ref.watch(categoryRecipesProvider(categoryId)),
      isEmpty: (recipes) => recipes.isEmpty,
      emptyMessage: 'No recipes in this category yet',
      onRetry: () => ref.invalidate(categoryRecipesProvider(categoryId)),
      builder: (recipes) => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const GapV(16),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(
            key: ValueKey(recipe.id),
            recipe: recipe,
            onTap: () => context.push(
              Routes.recipeDetails(recipe.id, origin: Routes.categories),
            ),
          );
        },
      ),
    );
    Widget list = MyAsyncView(
      value: categories,
      isEmpty: (_) => category == null,
      emptyMessage: 'Category not found',
      onRetry: () => ref.invalidate(categoriesProvider),
      builder: (_) => recipes,
    );

    Widget header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Row(children: [BackBtn()])),

        MyText(category?.name ?? '', ms.pop20w600PinkMain),
        Expanded(child: SizedBox()),
      ],
    );
    header = Column(children: [const GapTop(), header, const GapV(16)]);
    header = HPadding(16, header);

    Widget current = Column(
      children: [
        header,
        Expanded(child: list),
      ],
    );

    return ColoredBox(color: mc.bg, child: current);
  }
}
