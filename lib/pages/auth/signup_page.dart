import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_rich_text.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/my_text_field.dart';
import 'package:recipe_app/widgets/unfocus.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  late TapGestureRecognizer _termsRecongizer;
  late TapGestureRecognizer _policyRecognizer;
  late TapGestureRecognizer _loginRecongizner;
  @override
  void initState() {
    _termsRecongizer = TapGestureRecognizer()
      ..onTap = () => showPlaceholder('Terms Placeholder');
    _policyRecognizer = TapGestureRecognizer()
      ..onTap = () => showPlaceholder('Policy Placeholder');
    _loginRecongizner = TapGestureRecognizer()
      ..onTap = () => showPlaceholder('Login Page routing placeholder');
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
    _termsRecongizer.dispose();
    _policyRecognizer.dispose();
    _loginRecongizner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = ListView(
      children: [
        const GapV(32),
        MyText.center('Sign Up', ms.pop20w600PinkMain),
        const GapV(64),
        MyTextField(hint: 'John Doe', label: 'Full Name'),
        const GapV(16),
        MyTextField(hint: 'example@mail.com', label: 'Email'),
        const GapV(16),
        MyTextField(hint: 'DD / MM / YYYY', label: 'Date Of Birth'),
        const GapV(16),
        MyTextField(hint: '●●●●●●●●', label: 'Passowrd', isPsw: true),
        const GapV(16),
        MyTextField(hint: '●●●●●●●●', label: 'Confirm Passowrd', isPsw: true),
        const GapV(24),
        MyRichText.center(
          children: [
            TextSpan(text: 'By signing up, you agree to our '),
            TextSpan(
              text: 'Terms of Use ',
              style: ms.pop13w600PinkMain,
              recognizer: _termsRecongizer,
            ),
            TextSpan(text: 'and '),
            TextSpan(
              text: 'Privacy Policy',
              style: ms.pop13w600PinkMain,
              recognizer: _policyRecognizer,
            ),
          ],
          style: ms.pop13w400TextPrime,
        ),
        const GapV(12),
        Button.pinkMainTH20(text: 'Sign Up', onTap: () {}),
        const GapV(12),
        MyRichText.center(
          children: [
            TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Log in',
              recognizer: _loginRecongizner,
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
