import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/models/recipe_category.dart';
import 'package:recipe_app/providers/recipe_providers.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class HomeCategoriesStrip extends ConsumerWidget {
  const HomeCategoriesStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget current = MyAsyncView(
      value: ref.watch(categoriesProvider),
      onRetry: () => ref.invalidate(categoriesProvider),
      builder: (categories) => ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const GapH(16),
        itemBuilder: (context, index) =>
            _CategoryChip(category: categories[index]),
      ),
    );
    current = SizedBox(height: 96, child: current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Categories', ms.pop15w500TextPrime)),
        const GapV(12),
        current,
      ],
    );
    return current;
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.category});
  final RecipeCategory category;

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      children: [
        MyNetworkAvatar(
          category.imageUrl,
          radius: 30,
          borderColor: mc.pinkMain,
        ),
        const GapV(6),
        MyText.center(category.name, ms.pop12w400TextPrime, lines: 1),
      ],
    );
    current = SizedBox(width: 72, child: current);
    current = GestureDetector(
      onTap: () => context.go(Routes.categoryRecipes, extra: category),
      child: current,
    );
    return current;
  }
}
