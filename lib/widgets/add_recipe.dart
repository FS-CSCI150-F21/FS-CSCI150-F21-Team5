import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 80,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Recipes'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Add Name', style: TextStyle(fontSize: 22)),
                    _buildName(),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
