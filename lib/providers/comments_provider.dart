import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/models/profile.dart';

// Keyed by Recipe identity — placeholder recipes have no id yet.
final commentsProvider =
    NotifierProvider.family<CommentsNotifier, List<RecipeComment>, Recipe>(
      CommentsNotifier.new,
    );

class CommentsNotifier extends FamilyNotifier<List<RecipeComment>, Recipe> {
  @override
  List<RecipeComment> build(Recipe arg) => RecipeData.placeholderComments;

  void add({required String text, required Profile author}) {
    final comment = RecipeComment(
      author: author,
      text: text,
      createdAt: DateTime.now(),
    );
    state = [comment, ...state];
  }
}
