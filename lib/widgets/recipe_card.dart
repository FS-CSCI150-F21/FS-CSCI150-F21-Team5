import 'package:flutter/material.dart';
import '../models/recipes_model.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  //Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Text("Hello"),
    );
  }
}
