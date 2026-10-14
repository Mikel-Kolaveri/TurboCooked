import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';

// Keyed by Recipe identity — placeholder recipes have no id yet.
final commentsProvider =
    NotifierProvider.family<CommentsNotifier, List<RecipeComment>, Recipe>(
      CommentsNotifier.new,
    );

class CommentsNotifier extends FamilyNotifier<List<RecipeComment>, Recipe> {
  @override
  List<RecipeComment> build(Recipe arg) => RecipeData.placeholderComments;

  void add({
    required String text,
    required String authorName,
    required String avatarUrl,
  }) {
    final comment = RecipeComment(
      authorName: authorName,
      avatarUrl: avatarUrl,
      text: text,
      createdAt: DateTime.now(),
    );
    state = [comment, ...state];
  }
}
