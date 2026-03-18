library;

import 'package:flutter/material.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';
import 'package:recipe_app/widgets/my_text.dart';
part 'src/your_recipes_item.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final testChildren = [
      RecipeItem(
        imgPath: TestNetworkImages.pasta,
        name: 'TestName',
        rating: 3,
        duration: 15,
        isFavorite: true,
      ),
      RecipeItem(
        imgPath: TestNetworkImages.muffins,
        name: 'TestName very very very long',
        rating: 3,
        duration: 15,
        isFavorite: false,
      ),
    ];

    Widget current = ListView.separated(
      itemBuilder: (context, index) => testChildren[index],
      separatorBuilder: (context, index) => GapH(16),
      scrollDirection: Axis.horizontal,
      itemCount: testChildren.length,
      padding: EdgeInsets.symmetric(horizontal: 32),
    );

    current = SizedBox(height: 184, child: current);

    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HPadding(32, MyText('Your Recipes', ms.pop15w500TextPrime)),
        const GapV(16),
        current,
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
