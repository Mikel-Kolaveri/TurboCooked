import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/providers/community_recipes_provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/pages/core_app/profile/src/profile_page_header.dart';
import 'package:recipe_app/pages/core_app/profile/src/social_info_bar.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(currentProfileProvider);
    final myRecipes = ref
        .watch(communityRecipesProvider)
        .where((r) => r.author.id == profile?.id)
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      children: [
        const GapTop(size: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => context.push(Routes.settings),
              child: Icon(Icons.settings_outlined, color: mc.pinkCream),
            ),
          ],
        ),
        const GapV(8),
        ProfilePageHeader(),
        const GapV(8),
        Row(
          children: [
            Expanded(
              child: _Button(text: 'Edit', onTap: () {}),
            ),
            const GapH(8),
            Expanded(
              child: _Button(text: 'Share', onTap: () {}),
            ),
          ],
        ),
        const GapV(16),
        SocialInfoBar(
          recipeCount: myRecipes.length,
          followingCount: profile?.followingCount ?? 0,
          followerCount: profile?.followerCount ?? 0,
        ),
        const GapV(16),
        if (myRecipes.isEmpty)
          MyText.center('No recipes yet', ms.pop13w400TextPrime)
        else
          // TODO: consider replacing with GridView
          Wrap(
            runSpacing: 24,
            spacing: 16,
            direction: Axis.horizontal,
            children: myRecipes
                .map((r) => RecipeItem.profile(recipe: r))
                .toList(),
          ),
        GapBottom.home(),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = MyText(text, ms.pop15w500PinkMain);
    current = SymPadding(h: 8, v: 4, child: current);
    current = Center(child: current);
    current = Container(
      decoration: BoxDecoration(
        color: mc.pinkCream,
        borderRadius: BorderRadius.circular(50),
      ),
      child: current,
    );
    current = GestureDetector(onTap: onTap, child: current);

    return current;
  }
}
