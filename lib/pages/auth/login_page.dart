import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_service.dart';
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
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TapGestureRecognizer _signUpRecognizer;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _submitted = false;
  String? _error;

  @override
  void initState() {
    _signUpRecognizer = TapGestureRecognizer()
      ..onTap = () => context.go(Routes.signup);
    super.initState();
  }

  @override
  void dispose() {
    _signUpRecognizer.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim()))
      // ignore: curly_braces_in_flow_control_structures
      return 'Enter a valid email address';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  Future<void> _signIn() async {
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      await ref
          .read(authServiceProvider)
          .signInWithEmail(
            _emailController.text.trim(),
            _passwordController.text,
          );
      if (mounted) context.go(Routes.home);
    } on AuthException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = 'Something went wrong. Please try again.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Future<void> _signInWithGoogle() async {
  //   setState(() {
  //     _isLoading = true;
  //     _error = null;
  //   });
  //   try {
  //     await ref.read(authServiceProvider).signInWithGoogle();
  //   } on AuthException catch (e) {
  //     setState(() => _error = e.message);
  //   } catch (_) {
  //     setState(() => _error = 'Something went wrong. Please try again.');
  //   } finally {
  //     if (mounted) setState(() => _isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Widget current = Form(
      key: _formKey,
      autovalidateMode: _submitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: ListView(
        children: [
          const GapV(32),
          MyText.center('Log In', ms.pop20w600PinkMain),
          const GapV(64),
          MyTextField(
            hint: 'example@mail.com',
            label: 'Email',
            controller: _emailController,
            validator: _validateEmail,
          ),
          const GapV(16),
          MyTextField(
            hint: '●●●●●●●●',
            label: 'Password',
            isPsw: true,
            controller: _passwordController,
            validator: _validatePassword,
          ),
          const GapV(12),
          Align(
            alignment: Alignment.centerLeft,
            child: MyText.center(
              'Forgot Password?',
              ms.pop14w600PinkMain,
              onTap: () {},
            ),
          ),
          if (_error != null) ...[
            const GapV(12),
            Text(
              _error!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
          const GapV(24),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else ...[
            Button.pinkMainTH20(text: 'Log In', onTap: () => _signIn()),
            // const GapV(12),
            // Button.pinkLightTH20(text: 'Continue with Google', onTap: () => _signInWithGoogle()),
          ],
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
      ),
    );

    current = SizedBox(width: double.infinity, child: current);
    current = HPadding(32, current);
    current = ColoredBox(color: mc.bgAuth, child: current);
    current = Center(child: current);
    current = SafeArea(child: current);
    current = Scaffold(body: current);
    current = UnFocus(current);

    return current;
  }
}
