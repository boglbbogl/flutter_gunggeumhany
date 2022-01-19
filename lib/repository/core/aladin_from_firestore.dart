import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:intl/intl.dart';

Future<String> aladinFromFirestoreCreatedAt({
  required String collectionName,
  String? documentName,
}) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _aladinRef =
      documentName == null
          ? _firestore.collection(collectionName)
          : _firestore
              .collection(collectionName)
              .doc(documentName)
              .collection(documentName);
  final _aladinSnapshot =
      await _aladinRef.orderBy("createdAt", descending: true).limit(1).get();
  final _createdAt = _aladinSnapshot.docs
      .map((e) => e.data()["createdAt"] as Timestamp)
      .firstOrNull;
  final _result =
      _createdAt != null ? DateFormat.yMMMEd().format(_createdAt.toDate()) : "";

  return _result;
}

Future<List<Book>> aladinFromFirestore({
  required String collectionName,
  String? documentName,
}) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Book> _aladinBookList = [];

  final CollectionReference<Map<String, dynamic>> _aladinRef =
      documentName == null
          ? _firestore.collection(collectionName)
          : _firestore
              .collection(collectionName)
              .doc(documentName)
              .collection(documentName);
  final CollectionReference<Map<String, dynamic>> _bookRef =
      _firestore.collection(collectionBook);
  final _aladinSnapshot =
      await _aladinRef.orderBy("createdAt", descending: true).limit(1).get();
  final _result = _aladinSnapshot.docs.map((e) => e.data()["ISBN"]).firstOrNull;
  if (_result != null) {
    for (final element in _result) {
      if (element != "") {
        final _bookSnapshot =
            await _bookRef.where("isbn13", isEqualTo: element).get();
        final Book? _bookResult =
            _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).isEmpty
                ? null
                : _bookSnapshot.docs
                    .map((e) => Book.fromJson(e.data()))
                    .firstOrNull!;
        if (_bookResult != null) {
          _aladinBookList.add(_bookResult);
        }
      }
    }
    return _aladinBookList;
  }
  return [];
}
