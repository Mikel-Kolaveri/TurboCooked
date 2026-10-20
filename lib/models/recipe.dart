import 'package:recipe_app/models/profile.dart';

class Ingredient {
  final String amount;
  final String name;

  const Ingredient(this.amount, this.name);
}

const _placeholderIngredients = [
  Ingredient('1 cup', 'Tomatoes'),
  Ingredient('100g', 'Cheese'),
  Ingredient('3', 'Cucumbers'),
  Ingredient('500g', 'Pasta'),
];

const _placeholderSteps = [
  'Prep and measure all of your ingredients before you start cooking.',
  'Heat a large pan over medium heat and add a splash of olive oil.',
  'Cook the main ingredients until golden, stirring occasionally.',
  'Season to taste, plate up, and serve while hot.',
];

class Recipe {
  final String name;
  final String imageUrl;
  final int durationMinutes;
  final Profile author;
  final String description;
  final int comments;
  final DateTime createdAt;
  final int servings;
  final List<Ingredient> ingredients;
  final List<String> steps;

  const Recipe({
    required this.name,
    required this.imageUrl,
    required this.durationMinutes,
    required this.author,
    required this.description,
    required this.comments,
    required this.createdAt,
    this.servings = 2,
    this.ingredients = _placeholderIngredients,
    this.steps = _placeholderSteps,
  });
}
