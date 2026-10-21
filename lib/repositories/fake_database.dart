import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipe_category.dart';
import 'package:recipe_app/models/recipe_comment.dart';

final fakeDatabaseProvider = Provider((ref) => FakeDatabase());

// One store behind both fake repositories, so a comment added through one
// shows up in the other's comment counts.
class FakeDatabase {
  final List<RecipeCategory> categories = RecipeData.categories;
  final List<Recipe> recipes = [...RecipeData.recipes];
  final List<RecipeComment> comments = [...RecipeData.comments];

  // Long enough for loading states to be visible while testing.
  Future<void> simulateNetworkDelay() =>
      Future.delayed(const Duration(milliseconds: 400));
}
