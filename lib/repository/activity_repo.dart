import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class ActivityRepo {
  static final ActivityRepo _activityRepo = ActivityRepo._internal();
  factory ActivityRepo() => _activityRepo;
  ActivityRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addBookmark({
    required String userKey,
    required String bookDocKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(bookDocKey);
    final _batch = _firestore.batch();
    _batch.update(_activityRef, {
      "bookmarkBookDocKey": FieldValue.arrayUnion([bookDocKey])
    });
    _batch.update(_bookRef, {
      "bookmarkUserKey": FieldValue.arrayUnion([userKey])
    });
    await _batch.commit();
  }

  Future removeBookmark({
    required String userKey,
    required String bookDocKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(bookDocKey);
    final _batch = _firestore.batch();
    _batch.update(_activityRef, {
      "bookmarkBookDocKey": FieldValue.arrayRemove([bookDocKey])
    });
    _batch.update(_bookRef, {
      "bookmarkUserKey": FieldValue.arrayRemove([userKey])
    });
    await _batch.commit();
  }
}
