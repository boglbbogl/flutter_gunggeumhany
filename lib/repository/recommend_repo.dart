import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class RecommendRepo {
  static final RecommendRepo _recommendRepo = RecommendRepo._internal();
  factory RecommendRepo() => _recommendRepo;
  RecommendRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Book>> getHanyRecommendBookItem() async {
    final List<Book> _hanyBookList = [];
    final CollectionReference<Map<String, dynamic>> _hanyRef =
        _firestore.collection(collectionHanyRecommend);
    final _hanySnapshot =
        await _hanyRef.orderBy("createdAt", descending: true).limit(1).get();
    final _result =
        _hanySnapshot.docs.map((e) => e.data()["docKey"]).firstOrNull;
    if (_result != null) {
      for (final element in _result) {
        final DocumentReference<Map<String, dynamic>> _bookRef =
            _firestore.collection(collectionBook).doc(element.toString());
        final _bookSnapshot = await _bookRef.get();
        final Book _book = Book.fromJson(_bookSnapshot.data()!);
        _hanyBookList.add(_book);
      }
      return _hanyBookList;
    }
    return [];
  }
}
