import 'package:recipe_app/models/profile.dart';

const _avatar =
    'https://static.pincel.app/cdn-cgi/image/width=450,format=auto/https://static.pincel.app/media/3akuge0rlqsrf49mlnkh4o-zycyn.png';

class Ingredient {
  final String amount;
  final String name;

  const Ingredient(this.amount, this.name);
}

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

const _chefMarco = Profile(
  id: 'u_chef_marco',
  username: 'chef_marco',
  displayName: 'Marco Rossi',
  avatarUrl: _avatar,
  bio: 'Roman-born chef. Pasta is a love language.',
  followerCount: 1840,
  followingCount: 112,
);
const _nonnaItalia = Profile(
  id: 'u_nonna_italia',
  username: 'nonna_italia',
  displayName: 'Giulia Bianchi',
  avatarUrl: _avatar,
  bio: 'Sunday lunches, family recipes, no shortcuts.',
  followerCount: 2310,
  followingCount: 48,
);
const _dolceVita = Profile(
  id: 'u_dolce_vita',
  username: 'dolce_vita',
  displayName: 'Sofia Romano',
  avatarUrl: _avatar,
  bio: 'Italian desserts and strong espresso.',
  followerCount: 3020,
  followingCount: 201,
);
const _wokMaster = Profile(
  id: 'u_wok_master',
  username: 'wok_master',
  displayName: 'Kevin Chen',
  avatarUrl: _avatar,
  bio: 'High heat, fast hands.',
  followerCount: 960,
  followingCount: 77,
);
const _padThaiPro = Profile(
  id: 'u_pad_thai_pro',
  username: 'pad_thai_pro',
  displayName: 'Malee Srisuk',
  avatarUrl: _avatar,
  bio: 'Bangkok street food, made at home.',
  followerCount: 1475,
  followingCount: 133,
);
const _sushiLover = Profile(
  id: 'u_sushi_lover',
  username: 'sushi_lover',
  displayName: 'Yuki Tanaka',
  avatarUrl: _avatar,
  followerCount: 688,
  followingCount: 250,
);
const _ramenKing = Profile(
  id: 'u_ramen_king',
  username: 'ramen_king',
  displayName: 'Kenji Sato',
  avatarUrl: _avatar,
  bio: 'Broth takes time. Worth it.',
  followerCount: 2105,
  followingCount: 90,
);
const _sweetTooth = Profile(
  id: 'u_sweet_tooth',
  username: 'sweet_tooth',
  displayName: 'Emma Clarke',
  avatarUrl: _avatar,
  bio: 'Chocolate first, questions later.',
  followerCount: 3410,
  followingCount: 315,
);
const _bakerGrace = Profile(
  id: 'u_baker_grace',
  username: 'baker_grace',
  displayName: 'Grace Miller',
  avatarUrl: _avatar,
  bio: 'Weekend baker, weekday tester.',
  followerCount: 1290,
  followingCount: 184,
);
const _brownieQueen = Profile(
  id: 'u_brownie_queen',
  username: 'brownie_queen',
  displayName: 'Olivia Brown',
  avatarUrl: _avatar,
  followerCount: 845,
  followingCount: 162,
);
const _patissierJp = Profile(
  id: 'u_patissier_jp',
  username: 'patissier_jp',
  displayName: 'Jean-Pierre Laurent',
  avatarUrl: _avatar,
  bio: 'Classic French pastry, explained simply.',
  followerCount: 2780,
  followingCount: 64,
);
const _toastQueen = Profile(
  id: 'u_toast_queen',
  username: 'toast_queen',
  displayName: 'Chloe Evans',
  avatarUrl: _avatar,
  bio: 'Breakfast is the best meal. Fight me.',
  followerCount: 512,
  followingCount: 298,
);
const _quickEats = Profile(
  id: 'u_quick_eats',
  username: 'quick_eats',
  displayName: 'Sam Patel',
  avatarUrl: _avatar,
  bio: 'Dinner in 15 minutes or less.',
  followerCount: 1033,
  followingCount: 141,
);
const _veggieChef = Profile(
  id: 'u_veggie_chef',
  username: 'veggie_chef',
  displayName: 'Priya Nair',
  avatarUrl: _avatar,
  bio: 'Plants on the plate, flavour first.',
  followerCount: 1567,
  followingCount: 220,
);
const _eggMaster = Profile(
  id: 'u_egg_master',
  username: 'egg_master',
  displayName: 'Tom Becker',
  avatarUrl: _avatar,
  followerCount: 402,
  followingCount: 87,
);

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
  static List<Recipe> get allRecipes =>
      categories.expand((c) => c.recipes).toList();

  static final List<RecipeComment> placeholderComments = [
    RecipeComment(
      author: _sweetTooth,
      text: 'Made this last night and the whole family loved it!',
      createdAt: DateTime(2026, 9, 28),
    ),
    RecipeComment(
      author: _veggieChef,
      text: 'Swapped in mushrooms for a vegetarian version, worked great.',
      createdAt: DateTime(2026, 9, 20),
    ),
    RecipeComment(
      author: _quickEats,
      text: 'How long does this keep in the fridge?',
      createdAt: DateTime(2026, 9, 14),
    ),
    RecipeComment(
      author: _bakerGrace,
      text:
          'The step-by-step photos would be a nice addition, but super clear anyway.',
      createdAt: DateTime(2026, 8, 30),
    ),
    RecipeComment(
      author: _ramenKing,
      text: 'Added a bit of chili flakes. 10/10.',
      createdAt: DateTime(2026, 8, 12),
    ),
    RecipeComment(
      author: _toastQueen,
      text: 'Saving this one for the weekend!',
      createdAt: DateTime(2026, 7, 2),
    ),
  ];

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
          durationMinutes: 25,
          author: _chefMarco,
          description:
              'A Roman classic — egg-based sauce with crispy guanciale, pecorino, and a generous crack of black pepper.',
          comments: 47,
          createdAt: DateTime(2026, 5, 10),
          servings: 4,
          ingredients: const [
            Ingredient('400g', 'Spaghetti'),
            Ingredient('150g', 'Guanciale'),
            Ingredient('4', 'Egg yolks'),
            Ingredient('80g', 'Pecorino Romano'),
            Ingredient('1 tsp', 'Black pepper, freshly cracked'),
          ],
          steps: const [
            'Bring a large pot of salted water to a boil and cook the spaghetti until al dente.',
            'Meanwhile, cut the guanciale into strips and render it in a dry pan until crispy.',
            'Whisk the egg yolks with the grated pecorino and plenty of black pepper.',
            'Reserve a cup of pasta water, then toss the drained pasta with the guanciale off the heat.',
            'Stir in the egg mixture, loosening with pasta water until glossy. Serve immediately.',
          ],
        ),
        Recipe(
          name: 'Classic Beef Lasagna',
          imageUrl:
              'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600&q=80',
          durationMinutes: 90,
          author: _nonnaItalia,
          description:
              'Layers of slow-cooked bolognese, creamy béchamel, and fresh pasta sheets topped with golden mozzarella.',
          comments: 62,
          createdAt: DateTime(2026, 4, 22),
        ),
        Recipe(
          name: 'Parmesan Risotto',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-373498_11-af7aea1.jpg?quality=90&webp=true&resize=440,400',
          durationMinutes: 40,
          author: _chefMarco,
          description:
              'Silky arborio rice stirred to perfection with white wine, warm stock, and a heavy hand of Parmigiano-Reggiano.',
          comments: 31,
          createdAt: DateTime(2026, 5, 1),
        ),
        Recipe(
          name: 'Tiramisu',
          imageUrl:
              'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=600&q=80',
          durationMinutes: 30,
          author: _dolceVita,
          description:
              'Espresso-soaked ladyfingers layered with mascarpone cream and dusted with dark cocoa.',
          comments: 88,
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
          durationMinutes: 20,
          author: _wokMaster,
          description:
              'Day-old jasmine rice tossed in a smoking-hot wok with chicken, egg, soy sauce, and spring onions.',
          comments: 29,
          createdAt: DateTime(2026, 5, 18),
        ),
        Recipe(
          name: 'Pad Thai',
          imageUrl:
              'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=600&q=80',
          durationMinutes: 30,
          author: _padThaiPro,
          description:
              'Stir-fried rice noodles with shrimp, tofu, tamarind sauce, peanuts, and a squeeze of fresh lime.',
          comments: 54,
          createdAt: DateTime(2026, 4, 5),
        ),
        Recipe(
          name: 'Teriyaki Salmon',
          imageUrl:
              'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80',
          durationMinutes: 25,
          author: _sushiLover,
          description:
              'Pan-seared salmon glazed with a sweet-savory teriyaki sauce, served over steamed rice and sesame greens.',
          comments: 38,
          createdAt: DateTime(2026, 5, 7),
        ),
        Recipe(
          name: 'Spicy Ramen',
          imageUrl:
              'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600&q=80',
          durationMinutes: 20,
          author: _ramenKing,
          description:
              'Rich tonkotsu broth fired up with chili paste, soft-boiled egg, chashu pork, and nori.',
          comments: 71,
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
          durationMinutes: 20,
          author: _sweetTooth,
          description:
              'Individual chocolate cakes with a warm, gooey molten center — best served with vanilla ice cream.',
          comments: 93,
          createdAt: DateTime(2026, 2, 14),
        ),
        Recipe(
          name: 'Classic Cheesecake',
          imageUrl:
              'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=600&q=80',
          durationMinutes: 75,
          author: _bakerGrace,
          description:
              'Dense and creamy New York-style cheesecake on a buttery graham cracker crust with a hint of vanilla.',
          comments: 57,
          createdAt: DateTime(2026, 3, 28),
        ),
        Recipe(
          name: 'Fudgy Brownies',
          imageUrl:
              'https://images.unsplash.com/photo-1589749096594-cb1b82a81d0c?w=600&q=80',
          durationMinutes: 40,
          author: _brownieQueen,
          description:
              'Ultra-fudgy, crinkle-top brownies loaded with dark chocolate and a sprinkle of flaky sea salt.',
          comments: 44,
          createdAt: DateTime(2026, 4, 11),
        ),
        Recipe(
          name: 'Crème Brûlée',
          imageUrl:
              'https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?w=600&q=80',
          durationMinutes: 60,
          author: _patissierJp,
          description:
              'Silky vanilla custard beneath a perfectly torched caramel crust — the ultimate French indulgence.',
          comments: 66,
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
          durationMinutes: 10,
          author: _toastQueen,
          description:
              'Smashed ripe avocado on toasted sourdough with chili flakes, lemon zest, and a poached egg on top.',
          comments: 22,
          createdAt: DateTime(2026, 6, 1),
        ),
        Recipe(
          name: 'Cheese Quesadilla',
          imageUrl:
              'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=600&q=80',
          durationMinutes: 15,
          author: _quickEats,
          description:
              'Golden crispy tortilla stuffed with melted cheese, jalapeños, and a side of salsa and sour cream.',
          comments: 18,
          createdAt: DateTime(2026, 5, 29),
        ),
        Recipe(
          name: 'Veggie Stir Fry',
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Quick-dinner-recipes-c7ca11c.jpg?quality=90&webp=true&resize=1000,1000',
          durationMinutes: 20,
          author: _veggieChef,
          description:
              'Colorful mix of bell peppers, broccoli, and snap peas tossed in a garlic-ginger soy glaze.',
          comments: 26,
          createdAt: DateTime(2026, 5, 20),
        ),
        Recipe(
          name: 'Classic Omelette',
          imageUrl:
              'https://images.unsplash.com/photo-1510693206972-df098062cb71?w=600&q=80',
          durationMinutes: 10,
          author: _eggMaster,
          description:
              'Perfectly folded French omelette with a creamy interior, filled with herbs, cheese, and sautéed mushrooms.',
          comments: 15,
          createdAt: DateTime(2026, 6, 5),
        ),
      ],
    ),
  ];
}
