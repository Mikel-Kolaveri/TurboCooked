import 'package:recipe_app/models/profile.dart';

class Ingredient {
  final String amount;
  final String name;

  const Ingredient(this.amount, this.name);
}

class Recipe {
  final String id;
  final String categoryId;
  final String name;
  final String imageUrl;
  final int durationMinutes;
  final Profile author;
  final String description;
  final int commentCount;
  final DateTime createdAt;
  final int servings;
  final List<Ingredient> ingredients;
  final List<String> steps;

  const Recipe({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.imageUrl,
    required this.durationMinutes,
    required this.author,
    required this.description,
    required this.commentCount,
    required this.createdAt,
    this.servings = 2,
    required this.ingredients,
    required this.steps,
  });
}
