import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_service.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
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

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _policyRecognizer;
  late TapGestureRecognizer _loginRecognizer;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _submitted = false;
  String? _error;
  bool _success = false;

  @override
  void initState() {
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () => showPlaceholder('Terms Placeholder');
    _policyRecognizer = TapGestureRecognizer()
      ..onTap = () => showPlaceholder('Policy Placeholder');
    _loginRecognizer = TapGestureRecognizer()
      ..onTap = () => context.go(Routes.login);
    super.initState();
  }

  void showPlaceholder(String text) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          color: Colors.white,
          child: Text(text),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _policyRecognizer.dispose();
    _loginRecognizer.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Full name is required';
    if (value.trim().length < 2) return 'Name must be at least 2 characters';
    if (value.trim().length > 50) return 'Name must be at most 50 characters';
    if (!RegExp(r"^[a-zA-Z\s'\-]+$").hasMatch(value.trim())) {
      return 'Name can only contain letters, spaces, hyphens, or apostrophes';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain a number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  Future<void> _signUp() async {
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      await ref
          .read(authServiceProvider)
          .signUpWithEmail(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            fullName: _nameController.text.trim(),
          );
      if (mounted) {
        setState(() {
          _success = true;
          _isLoading = false;
        });
      }
    } on AuthException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = 'Something went wrong. Please try again.');
    } finally {
      if (mounted && !_success) setState(() => _isLoading = false);
    }
  }

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
          MyText.center('Sign Up', ms.pop20w600PinkMain),
          const GapV(64),
          MyTextField(
            hint: 'John Doe',
            label: 'Full Name',
            controller: _nameController,
            validator: _validateName,
          ),
          const GapV(16),
          MyTextField(
            hint: 'example@mail.com',
            label: 'Email',
            controller: _emailController,
            validator: _validateEmail,
          ),
          const GapV(16),
          MyTextField(
            hint: 'DD / MM / YYYY',
            label: 'Date Of Birth',
            controller: _dobController,
          ),
          const GapV(16),
          MyTextField(
            hint: '●●●●●●●●',
            label: 'Password',
            isPsw: true,
            controller: _passwordController,
            validator: _validatePassword,
          ),
          const GapV(16),
          MyTextField(
            hint: '●●●●●●●●',
            label: 'Confirm Password',
            isPsw: true,
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,
          ),
          const GapV(16),
          MyRichText.center(
            children: [
              TextSpan(text: 'By signing up, you agree to our '),
              TextSpan(
                text: 'Terms of Use ',
                style: ms.pop13w600PinkMain,
                recognizer: _termsRecognizer,
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
          if (_error != null) ...[
            const GapV(12),
            Text(
              _error!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
          if (_success) ...[
            const GapV(12),
            Text(
              'Check your email to confirm your account.',
              style: TextStyle(color: Colors.green.shade700, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
          const GapV(16),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else
            Button.pinkMainTH20(text: 'Sign Up', onTap: () => _signUp()),
          const GapV(16),
          MyRichText.center(
            children: [
              TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Log in',
                recognizer: _loginRecognizer,
                style: ms.pop13w600PinkMain,
              ),
            ],
            style: ms.pop13w400TextPrime,
          ),
          const GapV(16),
          Center(
            child: GestureDetector(
              onTap: () => ref.read(authStateNotifierProvider).continueAsGuest(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: mc.pinkMain),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MyText('Continue as guest', ms.pop13w600PinkMain),
              ),
            ),
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
