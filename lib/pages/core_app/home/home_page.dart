import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section_2.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section_3.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section_4.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section_5.dart';
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
    final user = ref.watch(currentUserProvider);

    Widget head = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText('Hi ${user?.displayName ?? 'there'}', ms.pop24w400PinkMain),
        MyText('What are we cooking today?', ms.pop13w400TextPrime),
      ],
    );
    head = HPadding(32, head);

    Widget label(String text) =>
        HPadding(32, MyText(text, ms.pop13w700TextPrime));

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapV(32),
        head,
        const GapV(16),
        label('Design 1 (current)'),
        const GapV(8),
        YourRecipes(),
        const GapV(32),
        label('Design 2'),
        const GapV(8),
        YourRecipes2(),
        const GapV(32),
        label('Design 3'),
        const GapV(8),
        YourRecipes3(),
        const GapV(32),
        label('Design 4'),
        const GapV(8),
        YourRecipes4(),
        const GapV(32),
        label('Design 5'),
        const GapV(8),
        YourRecipes5(),
        const GapV(32),
      ],
    );
    current = SingleChildScrollView(child: current);

    return current;
  }
}
