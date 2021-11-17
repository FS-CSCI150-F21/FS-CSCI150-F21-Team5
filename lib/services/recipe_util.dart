import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shakshuka/models/user_model.dart';

class RecipeUtil {
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


}
