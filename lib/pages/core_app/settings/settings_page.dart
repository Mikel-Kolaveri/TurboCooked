import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/settings_tile.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapTop(size: 24),
        Row(
          children: [
            const BackBtn(),
            const GapH(16),
            MyText('Settings', ms.pop18w600TextPrime),
          ],
        ),
        const GapV(24),
        const SettingsTile(
          icon: Icons.notifications_outlined,
          title: 'Notification',
        ),
        _divider(),
        const SettingsTile(
          icon: Icons.headset_mic_outlined,
          title: 'Help Center',
        ),
        _divider(),
        const SettingsTile(
          icon: Icons.verified_user_outlined,
          title: 'Privacy Policy',
        ),
        _divider(),
        const SettingsTile(icon: Icons.language_outlined, title: 'Language'),
        _divider(),
        const SettingsTile(
          icon: Icons.sync_outlined,
          title: 'Turn dark Theme',
          showArrow: false,
        ),
        _divider(),
        const SettingsTile(
          icon: Icons.logout_outlined,
          title: 'Log Out',
          showArrow: false,
        ),
        const GapV(24),
        MyText('Delete account', ms.pop20w600PinkMain),
        GapBottom.home(),
      ],
    );
    current = HPadding(24, current);
    current = SingleChildScrollView(child: current);
    return current;
  }

  Widget _divider() =>
      Divider(color: mc.pinkMain.withValues(alpha: 0.15), height: 1);
}
