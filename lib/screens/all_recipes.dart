import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshuka/models/dummy_data.dart';
import '../widgets/add_recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/full_recipe_view.dart';
import '../services/recipe_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// get recipes
var myUid = RecipeUtil().getUid();
final String stuff = FirebaseFirestore.instance.collection('myRecipes').where("uid", "==", myUid).toString();


class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 80,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20.0),
                title: Text('Recipes',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => RecipeCard(
                      recipe: dummyRecipeList[index],
                    ),
                childCount: dummyRecipeList.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AddRecipe()));
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 199, 40, 13),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ));
  }
}
