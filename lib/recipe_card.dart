import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakshuka/recipe.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({Key? key, required this.recipe }) : super(key: key);
  //const RecipeCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            // recipe name
            Text(
              recipe.name,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),

            // dividing box
            const SizedBox(height: 8.0),

            // creator name
            Text(
              recipe.creator.toString(),
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
