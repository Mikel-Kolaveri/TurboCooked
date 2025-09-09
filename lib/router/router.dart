import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/pages/auth/login_page.dart';
import 'package:recipe_app/pages/auth/signup_page.dart';
import 'package:recipe_app/pages/core%20app/community/community_page.dart';
import 'package:recipe_app/pages/core%20app/home/home_page.dart';
import 'package:recipe_app/pages/core%20app/profile/profile_page.dart';
import 'package:recipe_app/pages/core%20app/recipes/recipes_page.dart';
import 'package:recipe_app/pages/landing_page.dart';
import 'package:recipe_app/widgets/my_navigation_bar.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      //Landing
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
    ShellRoute(
      //Home
      builder: (context, state, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              child,
              Positioned(bottom: 16, child: MyNavigationBar()),
            ],
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      routes: [
        GoRoute(path: Routes.home, builder: (context, state) => HomePage()),
        GoRoute(
          path: Routes.community,
          builder: (context, state) => CommunityPage(),
        ),
        GoRoute(
          path: Routes.recipes,
          builder: (context, state) => RecipesPage(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => ProfilePage(),
        ),
      ],
    ),
  ],
);

abstract class Routes {
  static const String landing = '/';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String home = '/home';
  static const String community = '/community';
  static const String recipes = '/recipes';
  static const String profile = '/profile';
}
