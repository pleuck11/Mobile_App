import 'package:cloud_firestore/cloud_firestore.dart';

class StorageServices {
  final firestore = FirebaseFirestore.instance;

  Future<String> write(String key, dynamic value) async {
    var doc = await firestore.collection(key).add(value);
    await doc.update({'docId': doc.id});
    return doc.id;
  }

  dynamic read(String key, String uid) async {
    var snapshot =
        await firestore.collection(key).where('uid', isEqualTo: uid).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> delete(String key, String docId) async {
    await firestore.collection(key).doc(docId).delete();
  }

  Future<void> update(String key, String docId, dynamic value) async {
    await firestore.collection(key).doc(docId).update(value);
  }

  Future<void> deleteAll(String key) async {
    var snapshot =
        await firestore.collection(key).where('isDone', isEqualTo: true).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
