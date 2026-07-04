import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/my_text.dart';

/// Design 5 — "Minimal Magazine": no colored section background, text sits
/// below the image instead of overlaid, favorite heart is a small accent.
class YourRecipes5 extends StatelessWidget {
  const YourRecipes5({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleRecipes = RecipeData.categories
        .expand((c) => c.recipes)
        .take(3)
        .toList();

    final children = [
      for (var i = 0; i < sampleRecipes.length; i++)
        _MagazineRecipeCard(recipe: sampleRecipes[i], isFavorite: i == 0),
    ];

    Widget current = ListView.separated(
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => GapH(20),
      scrollDirection: Axis.horizontal,
      itemCount: children.length,
      padding: EdgeInsets.symmetric(horizontal: 32),
    );

    current = SizedBox(height: 200, child: current);

    Widget header = Row(
      children: [
        Container(width: 4, height: 16, color: mc.pinkMain),
        const GapH(8),
        MyText('Favorite Recipes', ms.pop15w500TextPrime),
      ],
    );

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [HPadding(32, header), const GapV(16), current],
    );
    return current;
  }
}

class _MagazineRecipeCard extends StatefulWidget {
  const _MagazineRecipeCard({required this.recipe, this.isFavorite = false});
  final Recipe recipe;
  final bool isFavorite;

  @override
  State<_MagazineRecipeCard> createState() => _MagazineRecipeCardState();
}

class _MagazineRecipeCardState extends State<_MagazineRecipeCard> {
  late bool _isFave;

  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const width = 150.0;

    Widget favIcon = MyCircleBox(
      padding: 6,
      color: mc.bg.opacityTo(0.55),
      child: MySvg(
        height: 14,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );
    favIcon = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: favIcon,
    );

    Widget image = Container(
      width: width,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: mc.textPrime.opacityTo(0.15)),
      ),
      child: Stack(
        children: [
          MyNetworkImage(widget.recipe.imageUrl, height: 120, width: width),
          Positioned(right: 8, top: 8, child: favIcon),
        ],
      ),
    );

    Widget meta = Row(
      children: [
        MySvg(MyAssets.star, height: 12),
        const GapH(4),
        MyText(widget.recipe.rating.toString(), ms.pop12w400PinkMain),
        const GapH(10),
        MySvg(MyAssets.clock, height: 12),
        const GapH(4),
        MyText('${widget.recipe.durationMinutes}min', ms.pop12w400PinkMain),
      ],
    );

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        const GapV(8),
        SizedBox(
          width: width,
          child: MyText(widget.recipe.name, ms.pop13w600TextPrime, lines: 1),
        ),
        const GapV(4),
        meta,
      ],
    );

    current = GestureDetector(
      onTap: () => context.go(
        Routes.recipeDetails(origin: Routes.home),
        extra: widget.recipe,
      ),
      child: current,
    );
    return current;
  }
}
