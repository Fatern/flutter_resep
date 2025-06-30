// lib/models/recipe.dart

class Recipe {
  final String id;
  final String name;
  final String imageUrl;
  final int cookingTimeMinutes;
  final String estimatedCostCategory;
  final List<String> ingredients;
  final List<String> instructions;
  final List<String> tips;

  const Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cookingTimeMinutes,
    required this.estimatedCostCategory,
    required this.ingredients,
    required this.instructions,
    required this.tips,
  });
}
