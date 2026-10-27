import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/repositories/recipe_repository.dart';

final communityRecipesProvider =
    AsyncNotifierProvider<CommunityRecipesNotifier, List<Recipe>>(
      CommunityRecipesNotifier.new,
    );

class CommunityRecipesNotifier extends AsyncNotifier<List<Recipe>> {
  @override
  Future<List<Recipe>> build() =>
      ref.watch(recipeRepositoryProvider).fetchCommunity();

  Future<void> publish(RecipeDraft draft) async {
    await ref.read(recipeRepositoryProvider).createRecipe(draft);
    // Refetches every provider that watches the repository, this one included.
    ref.invalidate(recipeRepositoryProvider);
  }
}
