import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const defaultImage = Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
);

//const defaultIngredient = const Ingredient();

enum RecipeDifficulty {
  easy,
  moderate,
  hard,
  shakshukaLord
}

class Ingredient {
  double quantity;
  String unit;
  String ingredient;

  Ingredient({
    this.quantity = 0,
    this.unit = '',
    this.ingredient = ''
  });
}

class Recipe {
  String name;
  String cookTime;
  String prepTime;
  String yield;
  RecipeDifficulty? difficulty;
  String creator;
  Image image;
  List<Ingredient> ingredients;
  List<String> directions;

  Recipe({
    required this.name,
    this.cookTime = '',
    this.prepTime = '',
    this.yield = '',
    this.difficulty,
    this.creator = '',
    this.image = defaultImage,
    required this.ingredients,
    required this.directions
  });
}




// list of recipes used in the recipes page
List<Recipe> recipes = [
  Recipe(
    name: 'Shakshuka',
    cookTime: '30 minutes',
    yield: '4 Servings',
    difficulty: RecipeDifficulty.easy,
    creator: 'Rachel Ray',
    image: Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/2/0/TM2808_Shakshuka.jpg.rend.hgtvcom.826.620.suffix/1552666959593.jpeg'),
    ingredients: <Ingredient>[
      Ingredient(ingredient: 'extra virgin olive oil'),
      Ingredient(quantity: 1, unit: 'pound', ingredient: 'ground lamb or beef'),
      Ingredient(quantity: 1, ingredient: 'onion'),
      Ingredient(quantity: 2, ingredient: 'red finger chili peppers'),
      Ingredient(quantity: 4, unit: 'large cloves', ingredient: 'garlic'),
      Ingredient(quantity: 1, unit: 'teaspoon', ingredient: 'caraway seed'),
      Ingredient(quantity: 1, unit: 'teaspoon', ingredient: 'pimenton or paprika'),
      Ingredient(quantity: 0.125, unit: 'teaspoons', ingredient: 'freshly grated nutmeg'),
      Ingredient(ingredient: 'salt and pepper'),
      Ingredient(quantity: 14, unit: 'ounces', ingredient: 'crushed or diced fire-roasted tomatoes'),
      Ingredient(quantity: 14, unit: 'ounces', ingredient: 'tomato sauce or passata'),
      Ingredient(quantity: 1, unit: 'drizzle', ingredient: 'honey (optional)'),
      Ingredient(quantity: 0.75, unit: 'pound brick', ingredient: 'feta in water'),
      Ingredient(quantity: 5, ingredient: 'large eggs'),
      Ingredient(ingredient: 'garlic naan bread'),
      Ingredient(quantity: 2, unit: 'tablespoons', ingredient: 'butter, melted'),
      Ingredient(ingredient: 'greek yogurt (optional)'),
      Ingredient(ingredient: 'cilantro leaves, picked'),
      Ingredient(quantity: 3, ingredient: 'scallions, finely chopped'),
    ],
    directions: <String>[
      'Preheat oven to 375 F.',
      'Gather your ingredients.',
      'Heat a large cast-iron skillet over medium-high heat. Add extra virgin olive oil to the pan, 2 turns of the pan. Add ground meat, crumble and cook until the pink color goes away and meat is lightly browned.',
      'Peel and chop onion, seed and finely chop the peppers and chop or slice the garlic. Add onions and peppers to the meat and stir to soften a few minutes. Add seeds, spices and garlic; stir.',
      'Puree in food processor a can of chipotle in adobo. Add 2 tablespoons to pan and the rest to a bag to freeze and store for another use.',
      'Add tomatoes, honey if using, feta and stir. Make 4 to 6 nests in meat sauce using the back of a wooden spoon and drop eggs into them. Transfer pan to oven for 8 to 10 minutes till eggs set.',
      'For naan, heat a griddle over high heat. Scatter a little water onto skillet and griddle the bread to blister, then flip. Brush bread with melted butter and cut into pieces/wide strips.',
      'Garnish eggs with dollops of yogurt if using, cilantro leaves and scallions. ',
    ],
  ),

  Recipe(
    name: 'Vanilla Cake',
    cookTime: '30 minutes',
    prepTime: '30 minutes',
    yield: 'Two 9-inch Cakes',
    difficulty: RecipeDifficulty.easy,
    creator: 'Food Network Magazine',
    image: Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/12/20/2/FNM_010113-Basic-Vanilla_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371613590018.jpeg'),
    ingredients: <Ingredient>[
      Ingredient(quantity: 2, unit: 'sticks', ingredient: 'unsalted butter (room temp, more need for pans)'),
      Ingredient(quantity: 3, unit: 'cups', ingredient: 'all-purpose flour (more for pans)'),
      Ingredient(quantity: 1, unit: 'tablespoon', ingredient: 'baking powder'),
      Ingredient(quantity: 0.5, unit: 'teaspoon', ingredient: 'salt'),
      Ingredient(quantity: 1.25, unit: 'cups', ingredient: 'sugar'),
      Ingredient(quantity: 4, ingredient: 'large eggs (room temp)'),
      Ingredient(quantity: 1, unit: 'tablespoon', ingredient: 'vanilla extract'),
      Ingredient(quantity: 1.25, unit: 'cups', ingredient: 'whole milk'),
    ],
    directions: <String>[
      'Preheat the oven to 350 degrees F. Butter two 9-inch-round cake pans and line the bottoms with parchment paper; butter the parchment and dust the pans with flour, tapping out the excess.',
      'Whisk 3 cups flour, the baking powder and salt in a bowl until combined. Beat 2 sticks butter and the sugar in a large bowl with a mixer on medium-high speed until light and fluffy, about 3 minutes. Reduce the mixer speed to medium; beat in the eggs, one at a time, scraping down the bowl as needed. Beat in the vanilla. (The mixture may look separated at this point.) Beat in the flour mixture in 3 batches, alternating with the milk, beginning and ending with flour, until just smooth.',
      'Divide the batter between the prepared pans. Bake until the cakes are lightly golden on top and a toothpick inserted into the middle comes out clean, 30 to 35 minutes. Transfer to racks and let cool 10 minutes, then run a knife around the edge of the pans and turn the cakes out onto the racks to cool completely. Remove the parchment. Trim the tops of the cakes with a long serrated knife to make them level, if desired.',
    ],
  ),

  Recipe(
      name: 'Recipe A',
      image: Image.network('https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/66/Cooked_Chicken_JE3_BE3.png'),
      ingredients: <Ingredient>[],
      directions: <String>[],
  ),

  Recipe(
    name: 'Recipe B',
    image: Image.network('https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/66/Cooked_Chicken_JE3_BE3.png'),
    ingredients: <Ingredient>[],
    directions: <String>[],
  ),

  Recipe(
    name: 'Recipe C',
    image: Image.network('https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/66/Cooked_Chicken_JE3_BE3.png'),
    ingredients: <Ingredient>[],
    directions: <String>[],
  ),
];