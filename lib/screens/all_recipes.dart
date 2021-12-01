import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshuka/screens/grocery_page.dart';
import '../widgets/add_recipe.dart';
import '../services/recipe_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      backgroundColor: const Color.fromARGB(1, 255, 255, 255),
      body: _showRecipes(),
    );
  }

  Widget _showRecipes() {
    if (querySnapshot != null) {
      return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              // ignore: prefer_const_constructors
              SliverAppBar(
                backgroundColor: Colors.white,
                flexibleSpace: const FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 20.0),
                  title: Text(
                    'Recipes',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroceryPage()));
                      },
                      icon: Icon(Icons.audiotrack)),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(20),
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                "${querySnapshot!.docs[index].get("imageURL")}",
                                height: 120.0,
                                width: 120.0,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Text(
                                        "${querySnapshot!.docs[index].get("name")}"),
                                  ),
                                  SizedBox(
                                    height: 15,
                                    child: Text(
                                        "${querySnapshot!.docs[index].get("duration")}"),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 120,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromARGB(
                                            255, 199, 40, 13),
                                        padding: const EdgeInsets.all(6),
                                        textStyle:
                                            const TextStyle(fontSize: 16),
                                      ),
                                      onPressed: () =>
                                          showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 200,
                                            color: Colors.amber,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                      'Modal BottomSheet'),
                                                  ElevatedButton(
                                                    child: const Text(
                                                        'Close BottomSheet'),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      child: const Text('More'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
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
    return await FirebaseFirestore.instance
        .collection("recipes")
        .where("uid", isEqualTo: RecipeUtil().uid)
        .get();
  }
}
