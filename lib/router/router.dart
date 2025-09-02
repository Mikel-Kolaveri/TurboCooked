import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/pages/auth/login_page.dart';
import 'package:recipe_app/pages/auth/signup_page.dart';
import 'package:recipe_app/pages/landing_page.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => PopScope(canPop: false, child: child),
      routes: [
        GoRoute(
          path: Routes.landing,
          builder: (context, state) => LandingPage(),
        ),
        GoRoute(path: Routes.signup, builder: (context, state) => SignupPage()),
        GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
      ],
    ),
  ],
);

abstract class Routes {
  static const String landing = '/';
  static const String signup = '/signup';
  static const String login = '/login';
}
