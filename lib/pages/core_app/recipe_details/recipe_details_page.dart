import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/pages/core_app/recipe_details/src/recipe_details_creator_profile.dart';
import 'package:recipe_app/pages/core_app/recipe_details/src/recipe_ingredient_item.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_custom_scrollview.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapTop(size: 24),
        RecipeDetailsCreatorProfile(),
        const GapV(32),
        MyText('Details', ms.pop20w600PinkMain),
        const GapV(4),
        MyText(
          'Tiramisu is a classic Italian dessert, featuring layers of'
          ' espresso-soaked ladyfingers, rich mascarpone cheese, and a dusting'
          ' of cocoa powder, creating a harmonious blend of creamy and'
          ' coffee flavors.',
          ms.pop12w400TextPrime.copyWith(height: 1.5),
        ),
        const GapV(32),
        MyText('Ingredients', ms.pop20w600PinkMain),
        const GapV(4),
        RecipeIngredientItem(
          ingredientAmountDescription: '1 cup',
          ingredientName: 'Tomatoes',
        ),
        RecipeIngredientItem(
          ingredientAmountDescription: '100g',
          ingredientName: 'Cheese',
        ),
        RecipeIngredientItem(
          ingredientAmountDescription: '3',
          ingredientName: 'Cucumbers',
        ),
        RecipeIngredientItem(
          ingredientAmountDescription: '500g',
          ingredientName: 'Pasta',
        ),
        GapBottom.home(),
      ],
    );
    current = HPadding(16, current);
    current = MyCustomScrollView(
      header: Image.network(TestNetworkImages.pasta, fit: BoxFit.cover),
      headerHeight: 300,
      children: [current],
    );
    return current;
  }
}
