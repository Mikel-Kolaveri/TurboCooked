import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/providers/community_recipes_provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
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
    Widget addButton = MyCircleBox(
      color: mc.pinkMain,
      padding: 8,
      child: Icon(Icons.add_rounded, color: mc.white, size: 24),
    );
    addButton = GestureDetector(
      onTap: () => context.push(Routes.createRecipe),
      child: addButton,
    );

    Widget header = Row(
      children: [
        MyText('Community Posts', ms.pop20w600PinkMain),
        const GapH.spacer(8),
        addButton,
      ],
    );
    header = Column(children: [const GapTop(), header, const GapV(10)]);
    header = HPadding(16, header);

    Widget list = MyAsyncView(
      value: ref.watch(communityRecipesProvider),
      isEmpty: (recipes) => recipes.isEmpty,
      emptyMessage: 'No recipes yet',
      onRetry: () => ref.invalidate(communityRecipesProvider),
      builder: (recipes) => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 96),
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const GapV(28),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(
            key: ValueKey(recipe.id),
            recipe: recipe,
            onTap: () => context.push(
              Routes.recipeDetails(origin: Routes.community),
              extra: recipe,
            ),
          );
        },
      ),
    );

    return Column(
      children: [
        header,
        Expanded(child: list),
      ],
    );
  }
}
