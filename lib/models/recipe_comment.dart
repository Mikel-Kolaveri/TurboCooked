import 'package:recipe_app/models/profile.dart';

class RecipeComment {
  final String id;
  final String recipeId;
  final Profile author;
  final String text;
  final DateTime createdAt;

  const RecipeComment({
    required this.id,
    required this.recipeId,
    required this.author,
    required this.text,
    required this.createdAt,
  });
}
