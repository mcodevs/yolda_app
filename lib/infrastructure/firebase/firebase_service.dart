import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';

class FirebaseService {
  static final _firebase = FirebaseFirestore.instance;
  static final radarPath = _firebase.collection('radars').withConverter(
        fromFirestore: (snapshot, options) =>
            BaseModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );

  Future<void> saveUser(UserModel userModel) async {
    await _firebase
        .collection('users')
        .doc(userModel.phoneNumber)
        .set(userModel.toJson());
  }

  static Future<bool> isUser(String phoneNumber) async {
    final data = await _firebase.collection('users').doc(phoneNumber).get();
    return data.exists;
  }
}
