import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';

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

  static Future<UserModel?> getOrChek(String phoneNumber) async {
    final data = await _firebase.collection('users').doc(phoneNumber).get();
    return data.data() == null ? null : UserModel.fromJson(data.data()!);
  }

  static Future<void> logOut(String phoneNumber) async {
    await _firebase.collection('users').doc(phoneNumber).update({
      "is-active": false,
    });
  }
}
