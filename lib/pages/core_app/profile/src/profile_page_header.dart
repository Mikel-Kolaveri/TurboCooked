import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_text.dart';

class ProfilePageHeader extends ConsumerWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGuest = ref.watch(authStateNotifierProvider).isGuest;
    final profile = ref.watch(currentProfileProvider);

    Widget current = MyNetworkAvatar(
      profile?.avatarUrl,
      radius: 56,
      borderColor: mc.pinkMain,
    );

    Widget text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          profile?.displayName ?? (isGuest ? 'Guest' : ''),
          ms.pop15w500PinkMain,
        ),
        if (profile != null) ...[
          MyText('@${profile.username}', ms.pop12w400PinkMain),
          if (profile.bio.isNotEmpty)
            MyText(profile.bio, ms.pop12w400TextPrime),
        ],
        if (isGuest)
          MyText('Sign in to personalize your profile.', ms.pop12w400TextPrime),
      ],
    );
    current = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        current,
        const GapH(16),
        Expanded(child: text),
      ],
    );
    return current;
  }
}
