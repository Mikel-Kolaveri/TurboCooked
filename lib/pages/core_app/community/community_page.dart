import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/pages/core_app/community/src/community_recipe_card.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const GapTop(),
        MyText('Community Posts', ms.pop20w600PinkMain),
        const GapV(20),

        const GapV(10),
        CommunityRecipeCard(
          username: 'julia_eats',
          timeAgo: DateTime(2026, 5, 25, 14),
          avatarUrl: TestNetworkImages.avatar,
          imageUrl: TestNetworkImages.chicken,
          title: 'Coq au Vin',
          rating: 5,
          description:
              'A French classic — chicken braised slowly in red wine with mushrooms, pearl onions, and smoky bacon until fall-apart tender.',
          cookTime: 90,
          views: 18400,
          comments: 63,
          isLiked: false,
        ),

        const GapV(28),

        const GapV(10),
        CommunityRecipeCard(
          username: 'spice_raj',
          timeAgo: DateTime(2026, 5, 22, 20),
          avatarUrl: TestNetworkImages.avatar,
          imageUrl: TestNetworkImages.curry,
          title: 'Chorizo Gnocchi Bake',
          rating: 4.9,
          description:
              'Golden pan-fried gnocchi tossed with spicy chorizo, mozzarella, and a rich tomato sauce.',
          cookTime: 40,
          views: 24100,
          comments: 89,
          isLiked: true,
        ),
        const GapV(28),

        GapBottom.home(),
      ],
    );
  }
}
