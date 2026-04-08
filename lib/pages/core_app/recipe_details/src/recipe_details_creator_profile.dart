import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class RecipeDetailsCreatorProfile extends ConsumerWidget {
  const RecipeDetailsCreatorProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget current = CircleAvatar(radius: 32);

    current = Row(
      children: [
        current,
        const GapH(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText('@Test Handle', (ms.pop14w400PinkMain)),
              MyText('Chefs name', (ms.pop16w400TextPrime), lines: 3),
            ],
          ),
        ),

        const GapH(8),
        Expanded(child: _Button()),
      ],
    );

    current = Column(
      children: [
        current,
        const GapV(16),
        Divider(color: mc.pinkMain.opacityTo(0.4), thickness: 1.5),
      ],
    );
    return current;
  }
}

class _Button extends StatefulWidget {
  const _Button();

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool _isFollowed = false;
  @override
  Widget build(BuildContext context) {
    final color1 = mc.pinkMain;
    final color2 = mc.pinkCream;
    Widget current = _isFollowed
        ? MyText('Following', ms.pop14w400PinkMain)
        : MyText('Follow', ms.pop14w400PinkCream);
    current = SymPadding(h: 24, v: 8, child: current);
    current = Center(child: current);
    current = Container(
      decoration: BoxDecoration(
        color: _isFollowed ? color2 : color1,
        borderRadius: BorderRadius.circular(50),
      ),
      // width: 200,
      child: current,
    );

    current = GestureDetector(
      onTap: () => setState(() {
        _isFollowed = !_isFollowed;
      }),
      child: current,
    );

    return current;
  }
}
