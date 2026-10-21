import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/models/profile.dart';

final commentsProvider =
    NotifierProvider.family<CommentsNotifier, List<RecipeComment>, String>(
      CommentsNotifier.new,
    );

class CommentsNotifier extends FamilyNotifier<List<RecipeComment>, String> {
  @override
  List<RecipeComment> build(String arg) => RecipeData.commentsFor(arg);

  void add({required String text, required Profile author}) {
    final now = DateTime.now();
    final comment = RecipeComment(
      // TODO: temporary local id; the comments repository should assign ids.
      id: 'local_${now.microsecondsSinceEpoch}',
      recipeId: arg,
      author: author,
      text: text,
      createdAt: now,
    );
    state = [comment, ...state];
  }
}
