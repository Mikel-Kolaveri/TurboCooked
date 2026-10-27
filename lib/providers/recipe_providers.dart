import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipe_category.dart';
import 'package:recipe_app/repositories/recipe_repository.dart';

final categoriesProvider = FutureProvider<List<RecipeCategory>>(
  (ref) => ref.watch(recipeRepositoryProvider).fetchCategories(),
);

final trendingRecipesProvider = FutureProvider<List<Recipe>>(
  (ref) => ref.watch(recipeRepositoryProvider).fetchTrending(),
);

final savedRecipesProvider = FutureProvider<List<Recipe>>(
  (ref) => ref.watch(recipeRepositoryProvider).fetchSaved(),
);

final categoryRecipesProvider = FutureProvider.family<List<Recipe>, String>(
  (ref, categoryId) =>
      ref.watch(recipeRepositoryProvider).fetchByCategory(categoryId),
);

final authorRecipesProvider = FutureProvider.family<List<Recipe>, String>(
  (ref, authorId) =>
      ref.watch(recipeRepositoryProvider).fetchByAuthor(authorId),
);
