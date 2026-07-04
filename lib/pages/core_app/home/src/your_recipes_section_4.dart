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

/// Design 4 — "Hero Carousel": one large swipeable card at a time with a
/// page-dot indicator, for a more editorial/featured feel.
class YourRecipes4 extends StatefulWidget {
  const YourRecipes4({super.key});

  @override
  State<YourRecipes4> createState() => _YourRecipes4State();
}

class _YourRecipes4State extends State<YourRecipes4> {
  final _controller = PageController(viewportFraction: 0.86);
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sampleRecipes = RecipeData.categories
        .expand((c) => c.recipes)
        .take(3)
        .toList();

    Widget current = PageView.builder(
      controller: _controller,
      onPageChanged: (page) => setState(() => _page = page),
      itemCount: sampleRecipes.length,
      itemBuilder: (context, index) => HPadding(
        6,
        _HeroRecipeCard(recipe: sampleRecipes[index], isFavorite: index == 0),
      ),
    );

    current = SizedBox(height: 220, child: current);

    Widget dots = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < sampleRecipes.length; i++) ...[
          if (i != 0) const GapH(6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: i == _page ? 18 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == _page
                  ? mc.textPrime
                  : mc.textPrime.opacityTo(0.35),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ],
    );

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Favorite Recipes', ms.pop15w500TextPrime)),
        const GapV(16),
        current,
        const GapV(12),
        dots,
      ],
    );
    current = Container(
      padding: EdgeInsets.only(top: 16, bottom: 16 + 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: mc.pinkMain,
      ),
      child: current,
    );
    return current;
  }
}

class _HeroRecipeCard extends StatefulWidget {
  const _HeroRecipeCard({required this.recipe, this.isFavorite = false});
  final Recipe recipe;
  final bool isFavorite;

  @override
  State<_HeroRecipeCard> createState() => _HeroRecipeCardState();
}

class _HeroRecipeCardState extends State<_HeroRecipeCard> {
  late bool _isFave;

  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  Widget _chip(String asset, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: mc.black.opacityTo(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MySvg(asset, height: 12),
          const GapH(4),
          MyText(text, ms.pop12w400TextPrime),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget favIcon = MyCircleBox(
      padding: 10,
      color: mc.black.opacityTo(0.4),
      border: Border.all(color: mc.white.opacityTo(0.6), width: 1),
      child: MySvg(
        height: 20,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );
    favIcon = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: favIcon,
    );

    Widget scrim = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [mc.black.opacityTo(0), mc.black.opacityTo(0.7)],
          stops: const [0.35, 1],
        ),
      ),
    );

    Widget title = MyText(widget.recipe.name, ms.pop18w600TextPrime, lines: 1);

    Widget chips = Row(
      children: [
        _chip(MyAssets.star, widget.recipe.rating.toString()),
        const GapH(8),
        _chip(MyAssets.clock, '${widget.recipe.durationMinutes}min'),
      ],
    );

    Widget info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [title, const GapV(8), chips],
    );
    info = Positioned(left: 16, right: 16, bottom: 16, child: info);

    Widget current = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          MyNetworkImage(widget.recipe.imageUrl),
          scrim,
          Positioned(right: 12, top: 12, child: favIcon),
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
