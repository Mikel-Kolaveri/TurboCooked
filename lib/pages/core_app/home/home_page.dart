import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section/your_recipes_section.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget head = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText('Hi USER!', ms.pop24w400PinkMain),
        MyText('What are we cooking today?', ms.pop13w400TextPrime),
      ],
    );
    head = HPadding(32, head);

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [const GapV(32), head, const GapV(16), YourRecipes()],
    );

    return current;
  }
}
