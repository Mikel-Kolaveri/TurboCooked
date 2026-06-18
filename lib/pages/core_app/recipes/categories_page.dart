import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/pages/core_app/recipes/src/category_item.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipesPageState();
}

class _RecipesPageState extends ConsumerState<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      children: [
        const GapTop(),
        MyText('Categories', ms.pop20w600PinkMain),
        const GapV(16),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 16,
          spacing: 16,
          children: RecipeData.categories
              .map(
                (category) => CategoryItem(
                  categoryText: category.name,
                  assetLink: category.imageUrl,
                  onTap: () =>
                      context.push(Routes.categoryRecipes, extra: category),
                ),
              )
              .toList(),
        ),
      ],
    );
    current = HPadding(32, current);

    current = ColoredBox(color: mc.bg, child: current);

    return current;
  }
}
