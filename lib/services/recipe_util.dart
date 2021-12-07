import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RecipeUtil {
  // TODO: lol fix this
  final uid = "n5iXPPa19TShpRzRb90nYfm1x8b2";

  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(File? imageFile) async {
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

  Future<String> getUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    return uid.toString();
  }

  Future updateRecipe(String name, List<String> ingredients, List<String> steps,
      File? image, Duration duration) async {
    var fileLoction = await uploadImage(image);

    return await recipesCollection.doc().set(
      {
        'name': name,
        'ingredients': ingredients,
        'steps': steps,
        'image': fileLoction,
        'uid': uid,
        'duration': duration.toString(),
      },
    );
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
