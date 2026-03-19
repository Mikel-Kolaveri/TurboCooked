import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class ProfilePageHeader extends ConsumerWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget current = CircleAvatar(
      backgroundImage: NetworkImage(TestNetworkImages.avatar),
      radius: 56,
    );

    Widget text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText('Test Name', (ms.pop15w500PinkMain)),
        MyText('@test_handle', (ms.pop12w400PinkMain)),
        MyText(
          'My passion is cooking and sharing new recipes with the world.',
          ms.pop12w400TextPrime,
        ),
      ],
    );

    current = Row(
      children: [
        current,
        const GapH(16),
        Expanded(child: text),
      ],
    );
    return current;
  }
}
