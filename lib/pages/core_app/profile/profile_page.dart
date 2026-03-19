import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/pages/core_app/home/src/your_recipes_section/your_recipes_section.dart';
import 'package:recipe_app/pages/core_app/profile/src/profile_page_header.dart';
import 'package:recipe_app/pages/core_app/profile/src/social_info_bar.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      children: [
        const GapTop(size: 16),

        ProfilePageHeader(),
        const GapV(8),
        Row(
          children: [
            Expanded(
              child: _Button(text: 'Edit', onTap: () {}),
            ),
            const GapH(8),
            Expanded(
              child: _Button(text: 'Share', onTap: () {}),
            ),
          ],
        ),
        const GapV(16),
        SocialInfoBar(),
        const GapV(16),
        Wrap(
          runSpacing: 24,
          spacing: 16,
          direction: Axis.horizontal,
          children: [
            RecipeItem.profile(
              imgPath: TestNetworkImages.risoto,
              name: 'Namee',
              rating: 3,
              duration: 5,
              isFavorite: false,
            ),
            RecipeItem.profile(
              imgPath: TestNetworkImages.curry,
              name: 'Namee',
              rating: 3,
              duration: 5,
              isFavorite: false,
            ),
            RecipeItem.profile(
              imgPath: TestNetworkImages.chicken,
              name: 'Namee',
              rating: 3,
              duration: 5,
              isFavorite: false,
            ),
            RecipeItem.profile(
              imgPath: TestNetworkImages.muffins,
              name: 'Namee',
              rating: 3,
              duration: 5,
              isFavorite: false,
            ),
            RecipeItem.profile(
              imgPath: TestNetworkImages.pasta,
              name: 'Namee',
              rating: 3,
              duration: 5,
              isFavorite: false,
            ),
          ],
        ),
        GapBottom.home(),
      ],
    );
    current = HPadding(32, current);
    current = SingleChildScrollView(child: current);
    return current;
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = MyText(text, ms.pop15w500PinkMain);
    current = SymPadding(h: 8, v: 4, child: current);
    current = Center(child: current);
    current = Container(
      decoration: BoxDecoration(
        color: mc.pinkCream,
        borderRadius: BorderRadius.circular(50),
      ),
      child: current,
    );
    current = GestureDetector(onTap: onTap, child: current);

    return current;
  }
}
