import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/router/router.dart';

void main() {
  group('path helpers', () {
    test('recipeDetails nests the recipe under its origin', () {
      expect(
        Routes.recipeDetails('r_1', origin: Routes.community),
        '/community/recipe/r_1',
      );
    });

    test('comments nests under the recipe', () {
      expect(
        Routes.comments('r_1', origin: Routes.community),
        '/community/recipe/r_1/comments',
      );
    });

    test('user nests the profile under its origin', () {
      expect(Routes.user('u_1', origin: Routes.home), '/home/user/u_1');
    });

    test('category sits under the categories tab', () {
      expect(Routes.category('c_1'), '/categories/category/c_1');
    });
  });

  group('tabRoot', () {
    String tabRoot(String path) => Routes.tabRoot(Uri.parse(path));

    test('returns the tab itself on a tab root', () {
      expect(tabRoot('/home'), '/home');
    });

    test('returns the tab from a details path', () {
      expect(tabRoot('/community/recipe/r_1'), '/community');
    });

    test('returns the tab from a comments path', () {
      expect(tabRoot('/profile/recipe/r_1/comments'), '/profile');
    });

    test('returns the tab from a user path', () {
      expect(tabRoot('/home/user/u_1'), '/home');
    });

    test('returns the tab from a category path', () {
      expect(tabRoot('/categories/category/c_1'), '/categories');
    });

    test('recovers the origin of every path built from a tab', () {
      const tabs = [
        Routes.home,
        Routes.community,
        Routes.categories,
        Routes.profile,
      ];

      for (final tab in tabs) {
        expect(tabRoot(Routes.recipeDetails('r_1', origin: tab)), tab);
        expect(tabRoot(Routes.comments('r_1', origin: tab)), tab);
        expect(tabRoot(Routes.user('u_1', origin: tab)), tab);
      }
    });
  });
}
