import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/core_app/profile/src/social_info_bar.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class AuthorProfilePage extends ConsumerWidget {
  const AuthorProfilePage({super.key, required this.recipe});

  /// The recipe the author was opened from; author info is read off it.
  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final author = recipe.author;
    final origin = Routes.recipeDetailsOrigin(
      GoRouterState.of(context).uri.path,
    );
    final authorRecipes = ref.watch(authorRecipesProvider(author.id));

    Widget header = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyNetworkAvatar(author.avatarUrl, radius: 56, borderColor: mc.pinkMain),
        const GapH(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(author.displayName, ms.pop15w500PinkMain),
              MyText('@${author.username}', ms.pop12w400PinkMain),
              if (author.bio.isNotEmpty)
                MyText(author.bio, ms.pop12w400TextPrime),
            ],
          ),
        ),
      ],
    );

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      children: [
        const GapTop(size: 24),
        Row(children: [const BackBtn()]),
        const GapV(16),
        header,
        const GapV(16),
        SocialInfoBar(
          recipeCount: authorRecipes.valueOrNull?.length ?? 0,
          followingCount: author.followingCount,
          followerCount: author.followerCount,
        ),
        const GapV(24),
        MyText('Recipes', ms.pop20w600PinkMain),
        const GapV(16),
        MyAsyncView(
          value: authorRecipes,
          isEmpty: (recipes) => recipes.isEmpty,
          emptyMessage: 'No recipes yet',
          onRetry: () => ref.invalidate(authorRecipesProvider(author.id)),
          builder: (recipes) => Wrap(
            runSpacing: 24,
            spacing: 16,
            children: recipes
                .map(
                  (r) => RecipeItem(
                    key: ValueKey(r.id),
                    recipe: r,
                    origin: origin,
                  ),
                )
                .toList(),
          ),
        ),
        GapBottom.home(),
      ],
    );
  }
}
