import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';

final communityRecipesProvider =
    NotifierProvider<CommunityRecipesNotifier, List<Recipe>>(
      CommunityRecipesNotifier.new,
    );

class CommunityRecipesNotifier extends Notifier<List<Recipe>> {
  @override
  List<Recipe> build() => RecipeData.allRecipes;

  void add(Recipe recipe) => state = [recipe, ...state];
}
