import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePageHeader extends ConsumerWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    final user = Supabase.instance.client.auth.currentUser;
    final isGuest = authState.isGuest;
    final fullName = user?.userMetadata?['full_name'] as String?
        ?? user?.userMetadata?['name'] as String?
        ?? (isGuest ? 'Guest' : '');
    final handle = fullName.isNotEmpty && !isGuest
        ? '@${fullName.toLowerCase().replaceAll(' ', '_')}'
        : '';
    final picUrl = user?.userMetadata?['avatar_url'] as String?;

    Widget current = MyNetworkAvatar(picUrl, radius: 56, borderColor: mc.pinkMain);

    Widget text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(fullName, (ms.pop15w500PinkMain)),
        if (handle.isNotEmpty) MyText(handle, (ms.pop12w400PinkMain)),
        MyText(
          isGuest
              ? 'Sign in to personalize your profile.'
              : 'My passion is cooking and sharing new recipes with the world.',
          ms.pop12w400TextPrime,
        ),
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
