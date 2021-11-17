import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/models/dummy_data.dart';
import '../widgets/add_recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/full_recipe_view.dart';
import '../services/recipe_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// get recipes
// var retrievedRecipes = FirebaseFirestore.instance.collection('recipes')
//     .where("uid", isEqualTo: RecipeUtil().getUid());

// Future getData() async {
//   return await FirebaseFirestore.instance.collection('recipes')
//       .where("uid", isEqualTo: RecipeUtil().getUid()).snapshots();
// }



/*
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
*/

/*class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key}) : super(key: key);

  void logstuff() {
    print(FirebaseFirestore.instance.collection('recipes')
        .where("uid", isEqualTo: RecipeUtil().uid).get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     style: TextButton.styleFrom(
      //       textStyle: const TextStyle(fontSize: 20),
      //     ),
      //     onPressed: logstuff,
      //     child: const Text('Log in with Apple'),
      //   ),
      // ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]),
                  );
                }, childCount: snapshot.data!.length),
              )
            ],
          )
              : const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}*/

class AllRecipes extends StatefulWidget {
  const AllRecipes({Key? key}) : super(key: key);
  @override
  _AllRecipesState createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  @override
  void initState() {
    super.initState();
    getRecipesList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  QuerySnapshot? querySnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showRecipes(),
    );
  }

  Widget _showRecipes() {
    if(querySnapshot != null) {
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
                      (context, index) => Column(
                    children: <Widget>[
                      Image.network("${querySnapshot!.docs[index].get("imageURL")}"),
                      Text("${querySnapshot!.docs[index].get("name")}"),
                      Text("Duration: ${querySnapshot!.docs[index].get("name")}"),
                    ],
                  ),
                  childCount: querySnapshot!.docs.length,
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
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getRecipesList() async {
    return await FirebaseFirestore.instance.collection("recipes")
        .where("uid", isEqualTo: RecipeUtil().uid).get();
  }

}

