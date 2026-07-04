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

/// Design 3 — "Stat Rows": vertically stacked list tiles (thumbnail left,
/// details right) instead of an image-only card grid.
class YourRecipes3 extends StatelessWidget {
  const YourRecipes3({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleRecipes = RecipeData.categories
        .expand((c) => c.recipes)
        .take(3)
        .toList();

    final children = <Widget>[
      for (var i = 0; i < sampleRecipes.length; i++) ...[
        if (i != 0) const GapV(12),
        _RecipeRow(recipe: sampleRecipes[i], isFavorite: i == 0),
      ],
    ];

    Widget current = Column(children: children);
    current = HPadding(32, current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Favorite Recipes', ms.pop15w500TextPrime)),
        const GapV(16),
        current,
      ],
    );
    current = Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: mc.pinkMain,
      ),
      child: current,
    );
    return current;
  }
}

class _RecipeRow extends StatefulWidget {
  const _RecipeRow({required this.recipe, this.isFavorite = false});
  final Recipe recipe;
  final bool isFavorite;

  @override
  State<_RecipeRow> createState() => _RecipeRowState();
}

class _RecipeRowState extends State<_RecipeRow> {
  late bool _isFave;

  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget thumb = Container(
      width: 64,
      height: 64,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: MyNetworkImage(widget.recipe.imageUrl),
    );

    Widget details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(widget.recipe.name, ms.pop13w600TextPrime, lines: 1),
        const GapV(6),
        Row(
          children: [
            MySvg(MyAssets.star, height: 12),
            const GapH(4),
            MyText(widget.recipe.rating.toString(), ms.pop12w400TextPrime),
            const GapH(12),
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
    details = Expanded(child: details);

    Widget favIcon = MyCircleBox(
      padding: 8,
      color: mc.textPrime.opacityTo(0.12),
      child: MySvg(
        height: 16,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );
    favIcon = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: favIcon,
    );

    Widget current = Row(
      children: [thumb, const GapH(12), details, const GapH(12), favIcon],
    );

    current = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: mc.textPrime.opacityTo(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: current,
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
