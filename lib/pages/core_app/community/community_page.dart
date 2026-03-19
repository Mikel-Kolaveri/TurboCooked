import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/pages/core_app/community/src/community_recipe_card.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      children: [
        const GapTop(),
        Text('Community Posts', style: ms.pop20w600PinkMain),
        const GapV(16),
        CommunityRecipeCard(
          username: 'name',
          timeAgo: DateTime.now(),
          avatarUrl: 'avatarUrl',
          imageUrl:
              'https://easyweeknight.com/wp-content/uploads/2019/02/creamy-garlic-butter-chicken-test.jpg.webp',
          title: 'Creamy Garlic Butter ',
          rating: 5,
          description: 'Tender chicken simmered ',
          cookTime: 45,
          views: 52125,
          comments: 50,
          isLiked: true,
        ),
        const GapV(16),
        CommunityRecipeCard(
          username: 'name',
          timeAgo: DateTime(2020),
          avatarUrl: 'avatarUrl',
          imageUrl:
              "https://p2.piqsels.com/preview/166/884/864/skewer-kebab-barbecue-food.jpg",
          title: 'Classic Shishkebab',
          rating: 5,
          description:
              'This recipe requires basic ingredients and minimal prep time, making it ideal for busy days...',
          cookTime: 45,
          views: 9000,
          comments: 10,
          isLiked: true,
        ),
        const GapV(16),
        CommunityRecipeCard(
          username: 'name',
          timeAgo: DateTime(2025, 10, 5, 1),
          avatarUrl: 'avatarUrl',
          imageUrl:
              'https://easyweeknight.com/wp-content/uploads/2019/02/creamy-garlic-butter-chicken-test.jpg.webp',
          title: 'Creamy Garlic Butter Chicken',
          rating: 5,
          description:
              'Tender chicken simmered in creamy garlic butter sauce, rich and savory, perfect for quick comforting weeknight dinners with rice.',
          cookTime: 45,
          views: 32500,
          comments: 23,
          isLiked: true,
        ),
        GapBottom.home(),
      ],
    );
    current = HPadding(32, current);

    current = SingleChildScrollView(child: current);

    return current;
  }
}
