import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_rich_text.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/my_text_field.dart';
import 'package:recipe_app/widgets/unfocus.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TapGestureRecognizer _signUpRecognizer;
  @override
  void initState() {
    _signUpRecognizer = TapGestureRecognizer()
      ..onTap = () => context.go(Routes.signup);
    super.initState();
  }

  void showPlaceholder(String text) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: EdgeInsets.all(32),
          color: Colors.white,
          child: Text(text),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = ListView(
      children: [
        const GapV(32),
        MyText.center('Log In', ms.pop20w600PinkMain),
        const GapV(64),
        MyTextField(hint: 'example@mail.com', label: 'Email'),
        const GapV(16),
        MyTextField(hint: '●●●●●●●●', label: 'Passowrd', isPsw: true),

        const GapV(12),
        Align(
          alignment: Alignment.centerLeft,
          child: MyText.center(
            'Forgot Password?',
            ms.pop14w600PinkMain,
            onTap: () => showPlaceholder('Forgot psw placeholder'),
          ),
        ),
        const GapV(24),
        Button.pinkMainTH20(
          text: 'Log In',
          onTap: () => context.go(Routes.home),
        ),

        const GapV(12),
        MyRichText.center(
          children: [
            TextSpan(text: "Don't have an account? "),
            TextSpan(
              text: 'Sign up',
              recognizer: _signUpRecognizer,
              style: ms.pop13w600PinkMain,
            ),
          ],
          style: ms.pop13w400TextPrime,
        ),
        const GapBottom(size: 40),
      ],
    );

    current = SizedBox(width: double.infinity, child: current);

    current = HPadding(current, 32);
    current = ColoredBox(color: mc.background, child: current);

    current = Center(child: current);

    current = SafeArea(child: current);
    current = Scaffold(body: current);
    current = UnFocus(current);

    return current;
  }
}
