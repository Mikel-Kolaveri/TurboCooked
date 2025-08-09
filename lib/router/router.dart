import 'package:go_router/go_router.dart';
import 'package:recipe_app/pages/auth/signup_page.dart';
import 'package:recipe_app/pages/landing_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: Routes.landing, builder: (context, state) => LandingPage()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignupPage()),
  ],
);

abstract class Routes {
  static const String landing = '/';
  static const String signUp = '/signup';
}
