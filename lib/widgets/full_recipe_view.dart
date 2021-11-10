import 'package:flutter/material.dart';
import '../models/recipes_model.dart';

class FullRecipeView extends StatelessWidget {
  final RecipeModel recipe;
  const FullRecipeView({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(recipe.imageURL),
        Text(recipe.name),
        Text(recipe.getDurationString),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: recipe.type.map((e) => Text(e.toString())).toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: recipe.ingredients.map((e) => Text(e)).toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: recipe.preparation.map((e) => Text(e)).toList(),
        ),
      ],
    );
  }
}
