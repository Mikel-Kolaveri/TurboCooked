import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/extensions/set_status_bar_theme.dart';
import 'package:recipe_app/pages/auth/login_page.dart';
import 'package:recipe_app/pages/auth/signup_page.dart';
import 'package:recipe_app/pages/core_app/community/community_page.dart';
import 'package:recipe_app/pages/core_app/home/home_page.dart';
import 'package:recipe_app/pages/core_app/profile/profile_page.dart';
import 'package:recipe_app/pages/core_app/recipes/categories_page.dart';
import 'package:recipe_app/pages/core_app/settings/settings_page.dart';
import 'package:recipe_app/pages/core_app/recipe_details/recipe_details_page.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/pages/core_app/recipes/category_recipes_list_page.dart';
import 'package:recipe_app/pages/landing_page.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/widgets/my_navigation_bar.dart';
part 'page_transitions.dart';

final router = GoRouter(
  refreshListenable: authStateNotifier,
  redirect: (context, state) {
    final hasAccess = authStateNotifier.hasAppAccess;
    final isOnAuthPage =
        state.uri.path == Routes.landing ||
        state.uri.path == Routes.login ||
        state.uri.path == Routes.signup;

    if (!hasAccess && !isOnAuthPage) return Routes.landing;
    if (authStateNotifier.isAuthenticated && isOnAuthPage) return Routes.home;
    return null;
  },
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
      builder: (context, state, child) {
        setMyStatusBarStyle(context);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PopScope(canPop: false, child: child),
                Positioned(bottom: 8, child: MyNavigationBar()),
              ],
            ),
          ),
          backgroundColor: mc.bg,
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              path: Routes._recipeDetails,
              builder: (context, state) => RecipeDetailsPage(recipe: state.extra as Recipe),
            ),
          ],
        ),

        GoRoute(
          path: Routes.community,
          builder: (context, state) => CommunityPage(),
          routes: [
            GoRoute(
              path: Routes._recipeDetails,
              builder: (context, state) => RecipeDetailsPage(recipe: state.extra as Recipe),
            ),
          ],
        ),
        GoRoute(
          path: Routes.categories,
          builder: (context, state) => CategoriesPage(),
          routes: [
            GoRoute(
              path: Routes._category,
              builder: (context, state) => CategoryRecipesListPage(
                category: state.extra as RecipeCategory,
              ),
              routes: [
                GoRoute(
                  path: Routes._recipeDetails,
                  builder: (context, state) => RecipeDetailsPage(recipe: state.extra as Recipe),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => ProfilePage(),
          routes: [
            GoRoute(
              path: Routes._recipeDetails,
              builder: (context, state) => RecipeDetailsPage(recipe: state.extra as Recipe),
            ),
          ],
        ),
        GoRoute(
          path: Routes.settings,
          builder: (context, state) => const SettingsPage(),
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
  static const String categories = '/categories';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static const String _recipeDetails = 'recipe_details';
  static const String _category = 'category';
  static const String categoryRecipes = '$categories/$_category';

  static String recipeDetails({required String origin}) =>
      '$origin/recipe_details';
}
