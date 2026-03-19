import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_custom_scrollview.dart';
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
      children: [
        const GapTop(),
        MyText('Categories', ms.pop20w600PinkMain),
        const GapV(16),
      ],
    );
    current = MyCustomScrollView(
      header: Image.asset(MyAssets.testMyrecipesPhoto),
      headerHeight: 300,
      children: [current],
    );
    return current;
  }
}
