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
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20.0),
                title: Text('Recipes',
                    style: TextStyle(
                      color: Colors.black,
                    )),
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
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ));
  }
}
