import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shakshuka/models/user_model.dart';

class RecipeUtil {

  // TODO: lol fix this
  final uid = "n5iXPPa19TShpRzRb90nYfm1x8b2";

  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');

  Future updateRecipe(
      String name, List<String> ingredients, List<String> steps) async {
    return await recipesCollection.doc().set(
      {
        'name': name,
        'ingredients': ingredients,
        'steps': steps,
      },
    );
  }

  Future<String> getUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    return uid.toString();
  }

  // List<DocumentSnapshot> getRecipes() {
  //   late var results;
  //   // FirebaseFirestore.instance.collection('recipes')
  //   //     .where("uid", isEqualTo: getUid()).get()
  //   //     .then((snapshot) {
  //   //       snapshot.docs.forEach((doc) {
  //   //         results.add(doc.data());
  //   //       });
  //   //     });
  // }

  // String uid = RecipeUtil().getUid();
  // print(FirebaseFirestore.instance.collection('recipes').where("uid", isEqualTo: uid).get().then((snapshot) {
  // snapshot.docs.forEach((doc) {
  // print(doc.data());
  // });
  // }));



  // DocumentReference<Map<String, dynamic>> stuff =
  //   FirebaseFirestore.instance.collection('recipes').toString();
  // List<DocumentSnapshot> morestuff = stuff.docs();

}
