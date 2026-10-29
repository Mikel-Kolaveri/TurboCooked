import 'package:recipe_app/models/profile.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipe_category.dart';
import 'package:recipe_app/repositories/fake_database.dart';
import 'package:recipe_app/repositories/recipe_repository.dart';

class FakeRecipeRepository implements RecipeRepository {
  FakeRecipeRepository(this._db, {required this.currentProfile});
  final FakeDatabase _db;
  final Profile? Function() currentProfile;

  // Fixed until Save exists, so every user sees the same favorites.
  static const _savedIds = {'r_spaghetti_carbonara', 'r_classic_beef_lasagna'};
  static const _trendingLimit = 5;

  @override
  Future<Recipe?> fetchRecipe(String id) async =>
      (await _select((r) => r.id == id)).firstOrNull;

  @override
  Future<List<RecipeCategory>> fetchCategories() async {
    await _db.simulateNetworkDelay();
    return [..._db.categories];
  }

  @override
  Future<List<Recipe>> fetchCommunity() => _select((_) => true);

  // Fake rule: most comments. The real one ranks activity in the last 7 days.
  @override
  Future<List<Recipe>> fetchTrending() async {
    final recipes = await _select((_) => true);
    recipes.sort((a, b) {
      final byComments = b.commentCount.compareTo(a.commentCount);
      return byComments != 0 ? byComments : _newestFirst(a, b);
    });
    return recipes.take(_trendingLimit).toList();
  }

  @override
  Future<List<Recipe>> fetchByCategory(String categoryId) =>
      _select((r) => r.categoryId == categoryId);

  @override
  Future<List<Recipe>> fetchByAuthor(String authorId) =>
      _select((r) => r.author.id == authorId);

  @override
  Future<List<Recipe>> fetchSaved() => _select((r) => _savedIds.contains(r.id));

  @override
  Future<Recipe> createRecipe(RecipeDraft draft) async {
    final author = currentProfile();
    if (author == null) throw StateError('Sign in to publish a recipe.');
    await _db.simulateNetworkDelay();

    final now = DateTime.now();
    final recipe = Recipe(
      id: 'r_${now.microsecondsSinceEpoch}',
      categoryId: draft.categoryId,
      name: draft.name,
      imageUrl: draft.imageUrl,
      durationMinutes: draft.durationMinutes,
      author: author,
      description: draft.description,
      commentCount: 0,
      createdAt: now,
      servings: draft.servings,
      ingredients: draft.ingredients,
      steps: draft.steps,
    );
    _db.recipes.add(recipe);
    return recipe;
  }

  Future<List<Recipe>> _select(bool Function(Recipe) where) async {
    await _db.simulateNetworkDelay();
    return _db.recipes.where(where).map(_withCommentCount).toList()
      ..sort(_newestFirst);
  }

  // Counted on read, like a SQL count over comments, so it can't drift from
  // the comments themselves.
  Recipe _withCommentCount(Recipe recipe) => Recipe(
    id: recipe.id,
    categoryId: recipe.categoryId,
    name: recipe.name,
    imageUrl: recipe.imageUrl,
    durationMinutes: recipe.durationMinutes,
    author: recipe.author,
    description: recipe.description,
    commentCount: _db.comments.where((c) => c.recipeId == recipe.id).length,
    createdAt: recipe.createdAt,
    servings: recipe.servings,
    ingredients: recipe.ingredients,
    steps: recipe.steps,
  );

  static int _newestFirst(Recipe a, Recipe b) =>
      b.createdAt.compareTo(a.createdAt);
}
