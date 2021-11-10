import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakshuka/models/firestore_constant.dart';

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
      FirestoreUserConstants.nickname: nickname,
      FirestoreUserConstants.photoUrl: photoUrl,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    String nickname = "";
    String photoUrl = "";
    String id = "";
    try {
      nickname = doc.get(FirestoreUserConstants.nickname);
    } catch (e) {}

    try {
      photoUrl = doc.get(FirestoreUserConstants.photoUrl);
    } catch (e) {}

    return UserModel(id: doc.id, nickname: nickname, photoUrl: photoUrl);
  }
}
