import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/providers/community_recipes_provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    final recipes = ref.watch(communityRecipesProvider);

    Widget addButton = MyCircleBox(
      color: mc.pinkMain,
      padding: 8,
      child: Icon(Icons.add_rounded, color: mc.white, size: 24),
    );
    addButton = GestureDetector(
      onTap: () => context.push(Routes.createRecipe),
      child: addButton,
    );

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
      itemCount: recipes.length + 1,
      separatorBuilder: (_, __) => const GapV(28),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GapTop(),
              Row(
                children: [
                  MyText('Community Posts', ms.pop20w600PinkMain),
                  const GapH.spacer(8),
                  addButton,
                ],
              ),
              const GapV(10),
            ],
          );
        }
        final recipe = recipes[index - 1];
        return RecipeCard(
          key: ValueKey(recipe.id),
          recipe: recipe,
          onTap: () => context.push(
            Routes.recipeDetails(origin: Routes.community),
            extra: recipe,
          ),
        );
      },
    );
  }
}
