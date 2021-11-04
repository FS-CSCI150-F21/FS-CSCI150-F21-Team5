// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final textFieldValueHolder = TextEditingController();

  final List<String> data = <String>['A', 'B', 'C', 'D'];

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please Enter Value in Text Field.'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addValue() {
    if (textFieldValueHolder.text == '') {
      showAlert(context);
    } else {
      setState(() {
        data.add(textFieldValueHolder.text);
      });
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 280,
                child: TextField(
                  controller: textFieldValueHolder,
                  autocorrect: true,
                  decoration:
                      const InputDecoration(hintText: 'Enter Ingredient'),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 22),
                ),
                child: const Text('Add Value To String Array'),
                onPressed: addValue,
              ),
            ),
            Container(
              child: ReorderableListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                children: <Widget>[
                  for (int index = 0; index < data.length; index++)
                    Card(
                      color: Colors.lightBlueAccent.shade100,
                      key: ValueKey(index),
                      child: ListTile(
                        key: Key('$index'),
                        title: Text('Item ${data[index]}'),
                      ),
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = data.removeAt(oldIndex);
                    data.insert(newIndex, item);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
