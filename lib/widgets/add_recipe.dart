// ignore_for_file: avoid_unnecessary_containers
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:shakshuka/services/recipe_util.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final titleFieldValueHolder = TextEditingController();
  final textFieldValueHolder = TextEditingController();
  final stepsFieldValueHolder = TextEditingController();
  File? image;
  Duration _duration = const Duration(hours: 0, minutes: 0);

  final List<String> data = <String>[];
  final List<String> steps = <String>[];

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

  Future<void>? _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) return;
    final tempImage = File(image.path);
    setState(() => this.image = tempImage);
  }

  void addIngredient() {
    if (textFieldValueHolder.text == '') {
      showAlert(context);
    } else {
      setState(() {
        data.add(textFieldValueHolder.text);
      });
      print(data); //For Debugging Only
    }
  }

  void addStep() {
    if (textFieldValueHolder.text == '') {
      showAlert(context);
    } else {
      setState(() {
        steps.add(stepsFieldValueHolder.text);
      });
      print(steps); //For Debugging Only
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              const SizedBox(
                height: 50,
                width: double.infinity,
                child: Align(
                  alignment: Alignment(-0.9, 1.0),
                  child: Text(
                    'Title',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 325,
                child: TextField(
                  controller: titleFieldValueHolder,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(199, 40, 13, 1),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 160,
                width: 160,
                child: image != null
                    ? Image.file(
                        image!,
                        width: 160,
                        height: 160,
                      )
                    : const FlutterLogo(
                        size: 160,
                      ),
              ),
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 199, 40, 13),
                    padding: const EdgeInsets.all(12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Add Image'),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ),
              const SizedBox(
                height: 50,
                width: double.infinity,
                child: Align(
                    alignment: Alignment(-0.9, 1.0),
                    child: Text(
                      'Durration',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(
                  child: DurationPicker(
                duration: _duration,
                onChange: (val) {
                  setState(() => _duration = val);
                },
                snapToMins: 5.0,
              )),
              const SizedBox(height: 30),
              SizedBox(
                  width: 325,
                  child: TextField(
                    controller: textFieldValueHolder,
                    autocorrect: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(199, 40, 13, 1),
                          width: 2.0,
                        ),
                      ),
                      hintText: 'Enter Ingredient',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: addIngredient,
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  children: <Widget>[
                    for (int index = 0; index < data.length; index++)
                      Card(
                        color: Colors.amberAccent.shade100,
                        key: ValueKey(index),
                        child: ListTile(
                          key: Key('$index'),
                          title: Text('${data[index]}'),
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
              const SizedBox(height: 30),
              SizedBox(
                width: 325,
                child: TextField(
                  controller: stepsFieldValueHolder,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Step',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(199, 40, 13, 1),
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: addStep,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  children: <Widget>[
                    for (int index = 0; index < steps.length; index++)
                      Card(
                        color: Colors.amberAccent.shade100,
                        key: ValueKey(index),
                        child: ListTile(
                          key: Key('$index'),
                          title: Text('${steps[index]}'),
                        ),
                      ),
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final String item = steps.removeAt(oldIndex);
                      steps.insert(newIndex, item);
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 199, 40, 13),
                      padding: const EdgeInsets.all(12),
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    child: const Text('Save'),
                    onPressed: () => RecipeUtil().updateRecipe(
                        titleFieldValueHolder.text.toString(),
                        data,
                        steps,
                        image)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
