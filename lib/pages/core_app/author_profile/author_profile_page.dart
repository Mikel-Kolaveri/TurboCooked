import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section.dart';
import 'package:recipe_app/pages/core_app/profile/src/social_info_bar.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_text.dart';

class AuthorProfilePage extends ConsumerWidget {
  const AuthorProfilePage({super.key, required this.recipe});

  /// The recipe the author was opened from; author info is read off it.
  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorName = recipe.authorName;
    final origin = Routes.recipeDetailsOrigin(
      GoRouterState.of(context).uri.path,
    );
    final recipes = RecipeData.byAuthor(authorName);

    Widget header = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyNetworkAvatar(
          recipe.authorAvatarUrl,
          radius: 56,
          borderColor: mc.pinkMain,
        ),
        const GapH(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(authorName, ms.pop15w500PinkMain),
              MyText('@$authorName', ms.pop12w400PinkMain),
              MyText(
                'Home cook sharing favourite recipes with the community.',
                ms.pop12w400TextPrime,
              ),
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
        SocialInfoBar(),
        const GapV(24),
        MyText('Recipes', ms.pop20w600PinkMain),
        const GapV(16),
        Wrap(
          runSpacing: 24,
          spacing: 16,
          children: recipes
              .map((r) => RecipeItem(recipe: r, origin: origin))
              .toList(),
        ),
        GapBottom.home(),
      ],
    );
  }
}
