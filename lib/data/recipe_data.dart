const _avatar =
    'https://static.pincel.app/cdn-cgi/image/width=450,format=auto/https://static.pincel.app/media/3akuge0rlqsrf49mlnkh4o-zycyn.png';

class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final int durationMinutes;
  final String authorName;
  final String authorAvatarUrl;
  final String description;
  final int comments;
  final int views;
  final DateTime createdAt;

  const Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.durationMinutes,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.description,
    required this.comments,
    required this.views,
    required this.createdAt,
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
  static final List<RecipeCategory> categories = [
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
          authorName: 'chef_marco',
          authorAvatarUrl: _avatar,
          description:
              'A Roman classic — egg-based sauce with crispy guanciale, pecorino, and a generous crack of black pepper.',
          comments: 47,
          views: 12300,
          createdAt: DateTime(2026, 5, 10),
        ),
        Recipe(
          name: 'Classic Beef Lasagna',
          imageUrl:
              'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600&q=80',
          rating: 4.7,
          durationMinutes: 90,
          authorName: 'nonna_italia',
          authorAvatarUrl: _avatar,
          description:
              'Layers of slow-cooked bolognese, creamy béchamel, and fresh pasta sheets topped with golden mozzarella.',
          comments: 62,
          views: 19800,
          createdAt: DateTime(2026, 4, 22),
        ),
        Recipe(
          name: 'Parmesan Risotto',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-373498_11-af7aea1.jpg?quality=90&webp=true&resize=440,400',
          rating: 4.6,
          durationMinutes: 40,
          authorName: 'chef_marco',
          authorAvatarUrl: _avatar,
          description:
              'Silky arborio rice stirred to perfection with white wine, warm stock, and a heavy hand of Parmigiano-Reggiano.',
          comments: 31,
          views: 8700,
          createdAt: DateTime(2026, 5, 1),
        ),
        Recipe(
          name: 'Tiramisu',
          imageUrl:
              'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=600&q=80',
          rating: 4.9,
          durationMinutes: 30,
          authorName: 'dolce_vita',
          authorAvatarUrl: _avatar,
          description:
              'Espresso-soaked ladyfingers layered with mascarpone cream and dusted with dark cocoa.',
          comments: 88,
          views: 27500,
          createdAt: DateTime(2026, 3, 14),
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
          authorName: 'wok_master',
          authorAvatarUrl: _avatar,
          description:
              'Day-old jasmine rice tossed in a smoking-hot wok with chicken, egg, soy sauce, and spring onions.',
          comments: 29,
          views: 9400,
          createdAt: DateTime(2026, 5, 18),
        ),
        Recipe(
          name: 'Pad Thai',
          imageUrl:
              'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=600&q=80',
          rating: 4.7,
          durationMinutes: 30,
          authorName: 'pad_thai_pro',
          authorAvatarUrl: _avatar,
          description:
              'Stir-fried rice noodles with shrimp, tofu, tamarind sauce, peanuts, and a squeeze of fresh lime.',
          comments: 54,
          views: 16200,
          createdAt: DateTime(2026, 4, 5),
        ),
        Recipe(
          name: 'Teriyaki Salmon',
          imageUrl:
              'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80',
          rating: 4.6,
          durationMinutes: 25,
          authorName: 'sushi_lover',
          authorAvatarUrl: _avatar,
          description:
              'Pan-seared salmon glazed with a sweet-savory teriyaki sauce, served over steamed rice and sesame greens.',
          comments: 38,
          views: 11100,
          createdAt: DateTime(2026, 5, 7),
        ),
        Recipe(
          name: 'Spicy Ramen',
          imageUrl:
              'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600&q=80',
          rating: 4.4,
          durationMinutes: 20,
          authorName: 'ramen_king',
          authorAvatarUrl: _avatar,
          description:
              'Rich tonkotsu broth fired up with chili paste, soft-boiled egg, chashu pork, and nori.',
          comments: 71,
          views: 22600,
          createdAt: DateTime(2026, 4, 30),
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
          authorName: 'sweet_tooth',
          authorAvatarUrl: _avatar,
          description:
              'Individual chocolate cakes with a warm, gooey molten center — best served with vanilla ice cream.',
          comments: 93,
          views: 31400,
          createdAt: DateTime(2026, 2, 14),
        ),
        Recipe(
          name: 'Classic Cheesecake',
          imageUrl:
              'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=600&q=80',
          rating: 4.8,
          durationMinutes: 75,
          authorName: 'baker_grace',
          authorAvatarUrl: _avatar,
          description:
              'Dense and creamy New York-style cheesecake on a buttery graham cracker crust with a hint of vanilla.',
          comments: 57,
          views: 18900,
          createdAt: DateTime(2026, 3, 28),
        ),
        Recipe(
          name: 'Fudgy Brownies',
          imageUrl:
              'https://images.unsplash.com/photo-1589749096594-cb1b82a81d0c?w=600&q=80',
          rating: 4.7,
          durationMinutes: 40,
          authorName: 'brownie_queen',
          authorAvatarUrl: _avatar,
          description:
              'Ultra-fudgy, crinkle-top brownies loaded with dark chocolate and a sprinkle of flaky sea salt.',
          comments: 44,
          views: 14700,
          createdAt: DateTime(2026, 4, 11),
        ),
        Recipe(
          name: 'Crème Brûlée',
          imageUrl:
              'https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?w=600&q=80',
          rating: 4.8,
          durationMinutes: 60,
          authorName: 'patissier_jp',
          authorAvatarUrl: _avatar,
          description:
              'Silky vanilla custard beneath a perfectly torched caramel crust — the ultimate French indulgence.',
          comments: 66,
          views: 21300,
          createdAt: DateTime(2026, 1, 20),
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
          authorName: 'toast_queen',
          authorAvatarUrl: _avatar,
          description:
              'Smashed ripe avocado on toasted sourdough with chili flakes, lemon zest, and a poached egg on top.',
          comments: 22,
          views: 7100,
          createdAt: DateTime(2026, 6, 1),
        ),
        Recipe(
          name: 'Cheese Quesadilla',
          imageUrl:
              'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=600&q=80',
          rating: 4.4,
          durationMinutes: 15,
          authorName: 'quick_eats',
          authorAvatarUrl: _avatar,
          description:
              'Golden crispy tortilla stuffed with melted cheese, jalapeños, and a side of salsa and sour cream.',
          comments: 18,
          views: 5600,
          createdAt: DateTime(2026, 5, 29),
        ),
        Recipe(
          name: 'Veggie Stir Fry',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Quick-dinner-recipes-c7ca11c.jpg?quality=90&webp=true&resize=1000,1000',
          rating: 4.5,
          durationMinutes: 20,
          authorName: 'veggie_chef',
          authorAvatarUrl: _avatar,
          description:
              'Colorful mix of bell peppers, broccoli, and snap peas tossed in a garlic-ginger soy glaze.',
          comments: 26,
          views: 8200,
          createdAt: DateTime(2026, 5, 20),
        ),
        Recipe(
          name: 'Classic Omelette',
          imageUrl:
              'https://images.unsplash.com/photo-1510693206972-df098062cb71?w=600&q=80',
          rating: 4.3,
          durationMinutes: 10,
          authorName: 'egg_master',
          authorAvatarUrl: _avatar,
          description:
              'Perfectly folded French omelette with a creamy interior, filled with herbs, cheese, and sautéed mushrooms.',
          comments: 15,
          views: 4900,
          createdAt: DateTime(2026, 6, 5),
        ),
      ],
    ),
  ];
}
