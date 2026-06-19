import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
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
    final recipes = RecipeData.categories.expand((c) => c.recipes).toList();

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
              MyText('Community Posts', ms.pop20w600PinkMain),
              const GapV(10),
            ],
          );
        }
        final recipe = recipes[index - 1];
        return RecipeCard(
          username: recipe.authorName,
          createdAt: recipe.createdAt,
          avatarUrl: recipe.authorAvatarUrl,
          imageUrl: recipe.imageUrl,
          title: recipe.name,
          rating: recipe.rating,
          description: recipe.description,
          cookTime: recipe.durationMinutes,
          views: recipe.views,
          comments: recipe.comments,
          onTap: () => context.push(
            Routes.recipeDetails(origin: Routes.community),
            extra: recipe,
          ),
        );
      },
    );
  }
}
