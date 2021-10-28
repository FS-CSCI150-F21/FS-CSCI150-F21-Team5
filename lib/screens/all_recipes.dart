import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
            // Add your onPressed code here!
          },
          child: const Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ));
  }
}
