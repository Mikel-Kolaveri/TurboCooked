import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipe_category.dart';
import 'package:recipe_app/repositories/fake_database.dart';
import 'package:recipe_app/repositories/fake_recipe_repository.dart';

final recipeRepositoryProvider = Provider<RecipeRepository>(
  (ref) => FakeRecipeRepository(
    ref.watch(fakeDatabaseProvider),
    currentProfile: () => ref.read(currentProfileProvider),
  ),
);

// Recipe lists come back newest first, except fetchTrending.
abstract interface class RecipeRepository {
  Future<Recipe?> fetchRecipe(String id);
  Future<List<RecipeCategory>> fetchCategories();
  Future<List<Recipe>> fetchCommunity();
  Future<List<Recipe>> fetchTrending();
  Future<List<Recipe>> fetchByCategory(String categoryId);
  Future<List<Recipe>> fetchByAuthor(String authorId);
  Future<List<Recipe>> fetchSaved();
  Future<Recipe> createRecipe(RecipeDraft draft);
}
