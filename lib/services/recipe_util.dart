import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RecipeUtil {
  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(var imageFile) async {
    if (imageFile != null) {
      Reference ref = storage.ref().child("/photo.jpg");
      UploadTask uploadTask = ref.putFile(imageFile);

      var dowurl = await (await uploadTask).ref.getDownloadURL();
      String url = dowurl.toString();

      return url;
    } else {
      return 'null';
    }
  }

  Future updateRecipe(String name, List<String> ingredients, List<String> steps,
      File? image) async {
    return await recipesCollection.doc().set(
      {
        'name': name,
        'ingredients': ingredients,
        'steps': steps,
        'image': uploadImage(image),
      },
    );
  }
}
