// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  String grocerie = '';

  createGrocery() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("groceries").doc(grocerie);

    //Map
    Map<String, String> groceries = {"groceriesTitle": grocerie};
  }

  deleteGrocery(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("groceries").doc(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Groceries"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: const Text("Add grocery"),
                content: TextField(
                  onChanged: (String value) {
                    grocerie = value;
                  },
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 199, 40, 13),
                      padding: const EdgeInsets.all(12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      createGrocery();

                      Navigator.of(context).pop();
                    },
                    child: const Text("Save"),
                  )
                ],
              );
            },
          );
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 199, 40, 13),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("groceries").snapshots(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      snapshots.data!.docs[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      deleteGrocery(documentSnapshot["groceriesTitle"]);
                    },
                    key: Key(documentSnapshot["groceriesTitle"]),
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(documentSnapshot["groceriesTitle"]),
                        trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              deleteGrocery(documentSnapshot["groceriesTitle"]);
                            }),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Align(
                alignment: FractionalOffset.bottomCenter,
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
