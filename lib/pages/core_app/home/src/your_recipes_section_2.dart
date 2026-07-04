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

/// Design 2 — "Cinematic Overlay": full-bleed image cards with a bottom
/// gradient scrim, on a dark (non-pink) section background.
class YourRecipes2 extends StatelessWidget {
  const YourRecipes2({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleRecipes = RecipeData.categories
        .expand((c) => c.recipes)
        .take(3)
        .toList();

    final children = [
      for (var i = 0; i < sampleRecipes.length; i++)
        _CinematicRecipeCard(recipe: sampleRecipes[i], isFavorite: i == 0),
    ];

    Widget current = ListView.separated(
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => GapH(16),
      scrollDirection: Axis.horizontal,
      itemCount: children.length,
      padding: EdgeInsets.symmetric(horizontal: 32),
    );

    current = SizedBox(height: 220, child: current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Favorite Recipes', ms.pop15w500TextPrime)),
        const GapV(16),
        current,
      ],
    );
    current = Container(
      padding: EdgeInsets.only(top: 16, bottom: 16 + 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: mc.bg,
        border: Border.all(color: mc.pinkMain.opacityTo(0.3)),
      ),
      child: current,
    );
    return current;
  }
}

class _CinematicRecipeCard extends StatefulWidget {
  const _CinematicRecipeCard({required this.recipe, this.isFavorite = false});
  final Recipe recipe;
  final bool isFavorite;

  @override
  State<_CinematicRecipeCard> createState() => _CinematicRecipeCardState();
}

class _CinematicRecipeCardState extends State<_CinematicRecipeCard> {
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
      padding: 8,
      color: mc.black.opacityTo(0.35),
      border: Border.all(color: mc.white.opacityTo(0.6), width: 1),
      child: MySvg(
        height: 16,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );
    favIcon = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: favIcon,
    );

    Widget scrim = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            mc.black.opacityTo(0),
            mc.black.opacityTo(0.75),
          ],
          stops: const [0.4, 1],
        ),
      ),
    );

    Widget info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(widget.recipe.name, ms.pop13w600TextPrime, lines: 2),
        const GapV(6),
        Row(
          children: [
            MySvg(MyAssets.star, height: 12),
            const GapH(4),
            MyText(widget.recipe.rating.toString(), ms.pop12w400TextPrime),
            const GapH(10),
            MySvg(MyAssets.clock, height: 12),
            const GapH(4),
            MyText(
              '${widget.recipe.durationMinutes}min',
              ms.pop12w400TextPrime,
            ),
          ],
        ),
      ],
    );
    info = Positioned(left: 12, right: 12, bottom: 12, child: info);

    Widget current = Container(
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          MyNetworkImage(widget.recipe.imageUrl),
          scrim,
          Positioned(right: 10, top: 10, child: favIcon),
          info,
        ],
      ),
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
