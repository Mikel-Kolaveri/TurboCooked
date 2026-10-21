import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/models/recipe.dart';

final communityRecipesProvider =
    NotifierProvider<CommunityRecipesNotifier, List<Recipe>>(
      CommunityRecipesNotifier.new,
    );

class CommunityRecipesNotifier extends Notifier<List<Recipe>> {
  @override
  List<Recipe> build() => RecipeData.recipes;

  void add(Recipe recipe) => state = [recipe, ...state];
}
