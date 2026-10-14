import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

// TODO: implement guest permissions properly, decide which actions guests can
// take and enforce them in one place instead of per-screen isGuest checks.
class GuestPopup extends StatelessWidget {
  const GuestPopup({super.key, required this.message});

  /// What the guest tried to do, e.g. 'Sign in to publish your own recipes.'
  final String message;

  static Future<void> show(BuildContext context, {required String message}) =>
      showDialog(
        context: context,
        builder: (_) => GuestPopup(message: message),
      );

  void _signIn(BuildContext context) {
    final router = GoRouter.of(context);
    router.pop();
    router.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText.center('Sign in required', ms.pop18w600TextPrime),
        const GapV(8),
        MyText.center(message, ms.pop13w400TextPrime),
        const GapV(24),
        Button.pinkMainTH20(text: 'Sign in', onTap: () => _signIn(context)),
        const GapV(16),
        MyText.center(
          'Not now',
          ms.pop14w600PinkMain,
          onTap: () => context.pop(),
        ),
      ],
    );
    current = AllPadding(24, current);
    current = Dialog(
      backgroundColor: mc.bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: mc.pinkMain.opacityTo(0.25)),
      ),
      child: current,
    );
    return current;
  }
}
