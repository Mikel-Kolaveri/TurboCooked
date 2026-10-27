import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/repositories/fake_comment_repository.dart';
import 'package:recipe_app/repositories/fake_database.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) => FakeCommentRepository(
    ref.watch(fakeDatabaseProvider),
    currentProfile: () => ref.read(currentProfileProvider),
  ),
);

// Comments come back newest first.
abstract interface class CommentRepository {
  Future<List<RecipeComment>> fetchComments(String recipeId);
  Future<RecipeComment> addComment(String recipeId, String text);
}
