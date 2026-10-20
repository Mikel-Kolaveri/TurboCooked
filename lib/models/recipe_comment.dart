import 'package:recipe_app/models/profile.dart';

class RecipeComment {
  final Profile author;
  final String text;
  final DateTime createdAt;

  const RecipeComment({
    required this.author,
    required this.text,
    required this.createdAt,
  });
}
