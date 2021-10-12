import 'package:flutter/cupertino.dart';

import '../recipe.dart';
import '../recipe_card.dart';


class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      /*  Take the list of Recipes "recipes", and then for each member of that
      list we name "recipe", we take that member and shove it into a RecipeCard
      Widget. We then convert this mapping into a list  */
      children: recipes.map((recipe) => RecipeCard(recipe: recipe)).toList(),
    );
  }
}