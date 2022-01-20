import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/review_user.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class RecommendRepo {
  static final RecommendRepo _recommendRepo = RecommendRepo._internal();
  factory RecommendRepo() => _recommendRepo;
  RecommendRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BookReviewUser>> getMainFeedCurrentUserPresentReview({
    required String userKey,
  }) async {
    final List<BookReviewUser> _bookReviewList = [];
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userKey);
    final _activitySnapshot = await _activityRef.get();
    final _activityModel = UserActivity.fromJson(_activitySnapshot.data()!);
    final List<String> _showDocKey = _activityModel.myReviewDocKey;
    if (_showDocKey.isNotEmpty) {
      final _sixLengthDocKey =
          _showDocKey.length > 6 ? _showDocKey.sublist(0, 6) : _showDocKey;
      for (final element in _sixLengthDocKey) {
        final DocumentReference<Map<String, dynamic>> _bookRef =
            _firestore.collection(collectionBook).doc(element);
        final _bookSnapshot = await _bookRef.get();
        if (_bookSnapshot.exists) {
          final Book _book = Book.fromJson(_bookSnapshot.data()!);
          final CollectionReference<Map<String, dynamic>> _reviewRef =
              _firestore
                  .collection(collectionBook)
                  .doc(element)
                  .collection(collectionReview);
          final _reviewSnapshot =
              await _reviewRef.where('userKey', isEqualTo: userKey).get();
          final Review? _review = _reviewSnapshot.docs
              .map((e) => Review.fromJson(e.data()))
              .firstOrNull;
          if (_review != null) {
            _bookReviewList.add(BookReviewUser(book: _book, review: _review));
          }
        }
      }
      return _bookReviewList;
    }
    return [];
  }

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
