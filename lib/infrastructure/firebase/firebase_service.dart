import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';

class FirebaseService {
  static final _firebase = FirebaseFirestore.instance;
  static final radarPath = _firebase.collection('radars').withConverter(
        fromFirestore: (snapshot, options) =>
            BaseModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
  
}
