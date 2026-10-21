import 'package:recipe_app/models/profile.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/repositories/comment_repository.dart';
import 'package:recipe_app/repositories/fake_database.dart';

class FakeCommentRepository implements CommentRepository {
  FakeCommentRepository(this._db, {required this.currentProfile});
  final FakeDatabase _db;
  final Profile? Function() currentProfile;

  @override
  Future<List<RecipeComment>> fetchComments(String recipeId) async {
    await _db.simulateNetworkDelay();
    return _db.comments.where((c) => c.recipeId == recipeId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<RecipeComment> addComment(String recipeId, String text) async {
    final author = currentProfile();
    if (author == null) throw StateError('Sign in to comment.');
    await _db.simulateNetworkDelay();

    final now = DateTime.now();
    final comment = RecipeComment(
      id: 'c_${now.microsecondsSinceEpoch}',
      recipeId: recipeId,
      author: author,
      text: text,
      createdAt: now,
    );
    _db.comments.add(comment);
    return comment;
  }
}
