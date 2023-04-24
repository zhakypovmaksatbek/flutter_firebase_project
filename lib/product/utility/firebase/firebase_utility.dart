import 'package:flutter_firebase_project/product/utility/base/base_firebase_model.dart';
import 'package:flutter_firebase_project/product/utility/firebase/firebase_collections.dart';

mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final newCollectionReference = collections.referance;
    final responce = await newCollectionReference.withConverter<T>(
      fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return {};
      },
    ).get();
    if (responce.docs.isNotEmpty) {
      final values = responce.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
