import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/repositories/comment_repository.dart';
import 'package:recipe_app/repositories/recipe_repository.dart';

final commentsProvider =
    AsyncNotifierProvider.family<CommentsNotifier, List<RecipeComment>, String>(
      CommentsNotifier.new,
    );

class CommentsNotifier
    extends FamilyAsyncNotifier<List<RecipeComment>, String> {
  @override
  Future<List<RecipeComment>> build(String arg) =>
      ref.watch(commentRepositoryProvider).fetchComments(arg);

  Future<void> add(String text) async {
    final comment = await ref
        .read(commentRepositoryProvider)
        .addComment(arg, text);

    final loaded = state.valueOrNull;
    // No list on screen yet (still loading or failed), so fetch it instead.
    if (loaded == null) {
      ref.invalidateSelf();
    } else {
      state = AsyncData([comment, ...loaded]);
    }
    // Recipe lists show comment counts. Rebuilding the repository refetches
    // every provider that watches it.
    ref.invalidate(recipeRepositoryProvider);
  }
}
