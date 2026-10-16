import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/extensions/int_extension.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeItem extends StatefulWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
    required this.origin,
    this.isFavorite = false,
  });
  const RecipeItem.home({
    super.key,
    required this.recipe,
    this.isFavorite = false,
  }) : origin = Routes.home;
  const RecipeItem.profile({
    super.key,
    required this.recipe,
    this.isFavorite = false,
  }) : origin = Routes.profile;
  final Recipe recipe;
  final bool isFavorite;
  final String origin;

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  late bool _isFave;
  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddH = 16; //ListView HPadding
    final mq = MediaQuery.of(context);
    final width = mq.size.width / 2 - 8 - paddH * 2;
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: mc.textPrime.opacityTo(0.85),
        borderRadius: BorderRadius.vertical(bottom: circular16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(widget.recipe.name, ms.pop12w400TextSec, lines: 2),
          const GapV(8),
          Row(
            children: [
              MySvg(MyAssets.clock),
              const GapH(4),
              MyText(
                widget.recipe.durationMinutes.toCookTime(),
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

    current = GestureDetector(
      child: current,
      onTap: () => context.push(
        Routes.recipeDetails(origin: widget.origin),
        extra: widget.recipe,
      ),
    );
    return current;
  }
}
