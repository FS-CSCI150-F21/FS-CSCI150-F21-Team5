import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakshuka/services/firestore_constant.dart';

class UserModel {
  String nickname;
  String photoUrl;
  String id;

  UserModel({
    required this.nickname,
    required this.photoUrl,
    required this.id,
  });
  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    String nickname = "";
    String photoUrl = "";
    String id = "";
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {}

    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}

    return UserModel(id: doc.id, nickname: nickname, photoUrl: photoUrl);
  }
}
