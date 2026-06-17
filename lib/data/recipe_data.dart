class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final int durationMinutes;

  const Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.durationMinutes,
  });
}

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

abstract class RecipeData {
  static const List<RecipeCategory> categories = [
    RecipeCategory(
      id: 'italian',
      name: 'Italian',
      imageUrl:
          'https://images.unsplash.com/photo-1551183053-bf91798b5f89?w=600&q=80',
      recipes: [
        Recipe(
          name: 'Spaghetti Carbonara',
          imageUrl:
              'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=600&q=80',
          rating: 4.8,
          durationMinutes: 25,
        ),
        Recipe(
          name: 'Classic Beef Lasagna',
          imageUrl:
              'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600&q=80',
          rating: 4.7,
          durationMinutes: 90,
        ),
        Recipe(
          name: 'Parmesan Risotto',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-373498_11-af7aea1.jpg?quality=90&webp=true&resize=440,400',
          rating: 4.6,
          durationMinutes: 40,
        ),
        Recipe(
          name: 'Tiramisu',
          imageUrl:
              'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=600&q=80',
          rating: 4.9,
          durationMinutes: 30,
        ),
      ],
    ),
    RecipeCategory(
      id: 'asian',
      name: 'Asian',
      imageUrl:
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600&q=80',
      recipes: [
        Recipe(
          name: 'Chicken Fried Rice',
          imageUrl:
              'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600&q=80',
          rating: 4.5,
          durationMinutes: 20,
        ),
        Recipe(
          name: 'Pad Thai',
          imageUrl:
              'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=600&q=80',
          rating: 4.7,
          durationMinutes: 30,
        ),
        Recipe(
          name: 'Teriyaki Salmon',
          imageUrl:
              'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80',
          rating: 4.6,
          durationMinutes: 25,
        ),
        Recipe(
          name: 'Spicy Ramen',
          imageUrl:
              'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600&q=80',
          rating: 4.4,
          durationMinutes: 20,
        ),
      ],
    ),
    RecipeCategory(
      id: 'desserts',
      name: 'Desserts',
      imageUrl:
          'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600&q=80',
      recipes: [
        Recipe(
          name: 'Chocolate Lava Cake',
          imageUrl:
              'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600&q=80',
          rating: 4.9,
          durationMinutes: 20,
        ),
        Recipe(
          name: 'Classic Cheesecake',
          imageUrl:
              'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=600&q=80',
          rating: 4.8,
          durationMinutes: 75,
        ),
        Recipe(
          name: 'Fudgy Brownies',
          imageUrl:
              'https://images.unsplash.com/photo-1589749096594-cb1b82a81d0c?w=600&q=80',
          rating: 4.7,
          durationMinutes: 40,
        ),
        Recipe(
          name: 'Crème Brûlée',
          imageUrl:
              'https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?w=600&q=80',
          rating: 4.8,
          durationMinutes: 60,
        ),
      ],
    ),
    RecipeCategory(
      id: 'quick_easy',
      name: 'Quick & Easy',
      imageUrl:
          'https://images.unsplash.com/photo-1541519227354-08fa5d50c820?w=600&q=80',
      recipes: [
        Recipe(
          name: 'Avocado Toast',
          imageUrl:
              'https://images.unsplash.com/photo-1541519227354-08fa5d50c820?w=600&q=80',
          rating: 4.3,
          durationMinutes: 10,
        ),
        Recipe(
          name: 'Cheese Quesadilla',
          imageUrl:
              'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=600&q=80',
          rating: 4.4,
          durationMinutes: 15,
        ),
        Recipe(
          name: 'Veggie Stir Fry',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Quick-dinner-recipes-c7ca11c.jpg?quality=90&webp=true&resize=1000,1000',
          rating: 4.5,
          durationMinutes: 20,
        ),
        Recipe(
          name: 'Classic Omelette',
          imageUrl:
              'https://images.unsplash.com/photo-1510693206972-df098062cb71?w=600&q=80',
          rating: 4.3,
          durationMinutes: 10,
        ),
      ],
    ),
  ];
}
