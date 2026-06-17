import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_text.dart';

class CategoryRecipesPage extends StatelessWidget {
  const CategoryRecipesPage({super.key, required this.category});
  final RecipeCategory category;

  @override
  Widget build(BuildContext context) {
    Widget grid = GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemCount: category.recipes.length,
      itemBuilder: (context, index) =>
          _RecipeCard(recipe: category.recipes[index]),
    );

    Widget header = Column(
      children: [
        const GapTop(),
        MyText(category.name, ms.pop20w600PinkMain),
        const GapV(8),
      ],
    );

    return Column(
      children: [
        header,
        Expanded(child: grid),
        GapBottom.home(),
      ],
    );
  }
}

class _RecipeCard extends StatefulWidget {
  const _RecipeCard({required this.recipe});
  final Recipe recipe;

  @override
  State<_RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<_RecipeCard> {
  bool _isFave = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width / 2 - 8 - 32;
    final height = mq.size.height / 3 - 32;

    Widget favIcon = MyCircleBox(
      padding: 10,
      color: mc.pinkMain,
      border: Border.all(color: Colors.white, width: 1),
      child: MySvg(
        height: 20,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );
    favIcon = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: favIcon,
    );

    const circular16 = Radius.circular(16);

    Widget textBubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: mc.textPrime.opacityTo(0.85),
        borderRadius: const BorderRadius.vertical(bottom: circular16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(widget.recipe.name, ms.pop12w400TextSec, lines: 2),
          const GapV(6),
          Row(
            children: [
              MyText(widget.recipe.rating.toString(), ms.pop12w400PinkMain),
              const GapH(4),
              MySvg(MyAssets.star),
              GapH.spacer(4),
              MySvg(MyAssets.clock),
              const GapH(4),
              MyText(
                '${widget.recipe.durationMinutes}min',
                ms.pop12w400PinkMain,
              ),
            ],
          ),
        ],
      ),
    );

    Widget current = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: mc.textPrime.opacityTo(0.4)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: MyNetworkImage(widget.recipe.imageUrl),
        ),
        Positioned(right: 8, top: 8, child: favIcon),
        Positioned(bottom: 0, width: width, child: textBubble),
      ],
    );

    return GestureDetector(
      onTap: () =>
          context.push(Routes.recipeDetails(origin: Routes.categoryRecipes)),
      child: current,
    );
  }
}
