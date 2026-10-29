import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/extensions/go_router_state_extension.dart';
import 'package:recipe_app/extensions/set_status_bar_theme.dart';
import 'package:recipe_app/pages/auth/login_page.dart';
import 'package:recipe_app/pages/auth/signup_page.dart';
import 'package:recipe_app/pages/core_app/author_profile/author_profile_page.dart';
import 'package:recipe_app/pages/core_app/comments/comments_page.dart';
import 'package:recipe_app/pages/core_app/community/community_page.dart';
import 'package:recipe_app/pages/core_app/community/create_recipe_page.dart';
import 'package:recipe_app/pages/core_app/home/home_page.dart';
import 'package:recipe_app/pages/core_app/profile/profile_page.dart';
import 'package:recipe_app/pages/core_app/recipes/categories_page.dart';
import 'package:recipe_app/pages/core_app/settings/settings_page.dart';
import 'package:recipe_app/pages/core_app/recipe_details/recipe_details_page.dart';
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

                if (state.uri.pathSegments.length == 1)
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
          routes: [_recipeRoute(), _userRoute()],
        ),
        GoRoute(
          path: Routes.community,
          builder: (context, state) => CommunityPage(),
          routes: [
            _recipeRoute(),
            _userRoute(),
            GoRoute(
              path: Routes._create,
              builder: (context, state) => const CreateRecipePage(),
            ),
          ],
        ),
        GoRoute(
          path: Routes.categories,
          builder: (context, state) => CategoriesPage(),
          routes: [
            GoRoute(
              path: '${Routes._category}/:$_categoryIdParam',
              builder: (context, state) => CategoryRecipesListPage(
                categoryId: state.pathParam(_categoryIdParam),
              ),
            ),
            _recipeRoute(),
            _userRoute(),
          ],
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => ProfilePage(),
          routes: [_recipeRoute(), _userRoute()],
        ),
        GoRoute(
          path: Routes.settings,
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);

const _recipeIdParam = 'recipeId';
const _userIdParam = 'userId';
const _categoryIdParam = 'categoryId';

GoRoute _recipeRoute() => GoRoute(
  path: '${Routes._recipe}/:$_recipeIdParam',
  builder: (context, state) =>
      RecipeDetailsPage(recipeId: state.pathParam(_recipeIdParam)),
  routes: [
    GoRoute(
      path: Routes._comments,
      builder: (context, state) =>
          CommentsPage(recipeId: state.pathParam(_recipeIdParam)),
    ),
  ],
);

GoRoute _userRoute() => GoRoute(
  path: '${Routes._user}/:$_userIdParam',
  builder: (context, state) =>
      AuthorProfilePage(userId: state.pathParam(_userIdParam)),
);

abstract class Routes {
  static const String landing = '/';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String home = '/home';
  static const String community = '/community';
  static const String categories = '/categories';
  static const String profile = '/profile';

  static const String settings = '$profile/settings';

  static const String _recipe = 'recipe';
  static const String _user = 'user';
  static const String _category = 'category';
  static const String _comments = 'comments';
  static const String _create = 'create';
  static const String createRecipe = '$community/$_create';

  static String recipeDetails(String id, {required String origin}) =>
      '$origin/$_recipe/$id';

  static String comments(String recipeId, {required String origin}) =>
      '${recipeDetails(recipeId, origin: origin)}/$_comments';

  static String user(String id, {required String origin}) =>
      '$origin/$_user/$id';

  static String category(String id) => '$categories/$_category/$id';

  /// The tab a nested page sits under, e.g. `/home` for `/home/recipe/r_1`.
  static String tabRoot(Uri uri) => '/${uri.pathSegments.first}';
}
