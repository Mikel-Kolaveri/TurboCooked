import 'package:recipe_app/models/recipe.dart';

class RecipeCategory {
  final String id;
  final String name;
  final String imageUrl;
  final List<Recipe> recipes;

  const RecipeCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.recipes,
  });
}
