import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/pages/core_app/profile/src/profile_page_header.dart';
import 'package:recipe_app/pages/core_app/profile/src/social_info_bar.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
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
    final recipeCount = profile == null
        ? 0
        : ref.watch(authorRecipesProvider(profile.id)).valueOrNull?.length ?? 0;

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
          recipeCount: recipeCount,
          followingCount: profile?.followingCount ?? 0,
          followerCount: profile?.followerCount ?? 0,
        ),
        const GapV(16),
        if (profile == null)
          const _GuestPrompt()
        else
          MyAsyncView(
            value: ref.watch(authorRecipesProvider(profile.id)),
            isEmpty: (recipes) => recipes.isEmpty,
            emptyMessage: 'No recipes yet',
            onRetry: () => ref.invalidate(authorRecipesProvider(profile.id)),
            // TODO: consider replacing with GridView
            builder: (recipes) => Wrap(
              runSpacing: 24,
              spacing: 16,
              direction: Axis.horizontal,
              children: recipes
                  .map(
                    (r) => RecipeItem.profile(key: ValueKey(r.id), recipe: r),
                  )
                  .toList(),
            ),
          ),
        GapBottom.home(),
      ],
    );
  }
}

class _GuestPrompt extends StatelessWidget {
  const _GuestPrompt();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText('Want to share your recipes? ', ms.pop13w400TextPrime),
        MyText(
          'Sign in',
          ms.pop13w600PinkMain,
          onTap: () => context.go(Routes.login),
        ),
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
