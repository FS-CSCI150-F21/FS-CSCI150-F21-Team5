import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshuka/widgets/add_recipe.dart';

class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: const CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Recipes'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AddRecipe()));
          },
          child: const Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ));
  }
}
