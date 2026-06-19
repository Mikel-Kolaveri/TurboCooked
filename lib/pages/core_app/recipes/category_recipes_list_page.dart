import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class CategoryRecipesListPage extends StatelessWidget {
  const CategoryRecipesListPage({super.key, required this.category});
  final RecipeCategory category;

  @override
  Widget build(BuildContext context) {
    Widget list = ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
      itemCount: category.recipes.length,
      separatorBuilder: (_, __) => const GapV(16),
      itemBuilder: (context, index) {
        final recipe = category.recipes[index];
        return RecipeCard(
          username: recipe.authorName,
          createdAt: recipe.createdAt,
          avatarUrl: recipe.authorAvatarUrl,
          imageUrl: recipe.imageUrl,
          title: recipe.name,
          rating: recipe.rating,
          description: recipe.description,
          cookTime: recipe.durationMinutes,
          comments: recipe.comments,
          views: recipe.views,
          onTap: () => context.push(
            Routes.recipeDetails(origin: Routes.categoryRecipes),
            extra: recipe,
          ),
        );
      },
    );

    Widget header = Column(
      children: [const GapTop(), MyText(category.name, ms.pop20w600PinkMain)],
    );

    return Column(
      children: [
        header,
        Expanded(child: list),
      ],
    );
  }
}
