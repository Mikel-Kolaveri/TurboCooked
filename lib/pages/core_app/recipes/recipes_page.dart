import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/pages/core_app/recipes/src/recipes_category_item.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipesPage extends ConsumerStatefulWidget {
  const RecipesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecipesPageState();
}

class _RecipesPageState extends ConsumerState<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      children: [
        const GapTop(),
        MyText('Categories', ms.pop20w600PinkMain),
        const GapV(16),
        // TODO: consider replacing with GridView.builder when categories come from data
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 16,
          spacing: 16,
          children: [
            RecipeCategoryItem(
              categoryText: 'Spicy herbs soup',
              assetLink:
                  "https://c4.wallpaperflare.com/wallpaper/373/952/839/wooden-spoon-condiments-background-wallpaper-preview.jpg",
            ),
            RecipeCategoryItem(
              categoryText: 'Very long recipe name ',
              assetLink:
                  "https://p2.piqsels.com/preview/166/884/864/skewer-kebab-barbecue-food.jpg",
            ),
            RecipeCategoryItem(
              categoryText: 'Goulash',
              assetLink:
                  "https://p2.piqsels.com/preview/854/281/249/kagyana-strapatsada-gdarta-shakshuka.jpg",
            ),
            RecipeCategoryItem(
              categoryText: 'Chocolate Ice Cream',
              assetLink:
                  "https://p2.piqsels.com/preview/733/148/987/chocolate-cake-chocolate-cake-recipe-chocolate-images-chocolate-ice-cream.jpg",
            ),
          ],
        ),
      ],
    );

    current = HPadding(32, current);
    return current;
  }
}
