import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Add Recipes'),
        ),
      )
    );
  }
}
