import 'package:flutter/material.dart';
import '../models/recipes_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: const EdgeInsets.fromLTRB(8, 16, 16, 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                recipe.id,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                )
            )


          ],
        ),
      ),
    );
  }
}
