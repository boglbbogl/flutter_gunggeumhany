import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/review_user.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class ReviewRepo {
  static final ReviewRepo _reviewRepo = ReviewRepo._internal();
  factory ReviewRepo() => _reviewRepo;
  ReviewRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Review> getMyReview({
    required String bookDocKey,
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _reviewRef = _firestore
        .collection(collectionBook)
        .doc(bookDocKey)
        .collection(collectionReview);
    final _snapshot = await _reviewRef.get();
    final _result = _snapshot.docs
        .map((e) => Review.fromJson(e.data()))
        .where((element) => userKey.contains(element.userKey))
        .toList();
    return _result[0];
  }

  Future<List<ReviewUser>> getUserJoinReview({
    required String bookDocKey,
  }) async {
    final List<ReviewUser> _userReviewList = [];
    final CollectionReference<Map<String, dynamic>> _reviewRef = _firestore
        .collection(collectionBook)
        .doc(bookDocKey)
        .collection(collectionReview);
    final _reviewSnapshot = await _reviewRef.get();
    final List<Review> _reviewList =
        _reviewSnapshot.docs.map((e) => Review.fromJson(e.data())).toList();
    for (final element in _reviewList) {
      final _userRef =
          _firestore.collection(collectionUser).doc(element.userKey);
      final _userSnapshot = await _userRef.get();
      final UserProfile _userProfile =
          UserProfile.fromJson(_userSnapshot.data()!);
      _userReviewList
          .add(ReviewUser(review: element, userProfile: _userProfile));
    }
    return _userReviewList;
  }

  Future deleteMyReview({
    required Review review,
  }) async {
    final DocumentReference<Map<String, dynamic>> _reviewRef = _firestore
        .collection(collectionBook)
        .doc(review.bookDocKey)
        .collection(collectionReview)
        .doc(review.docKey);
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(review.bookDocKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(review.userKey);
    final _batch = _firestore.batch();
    _batch.delete(_reviewRef);
    _batch.update(_activityRef, {
      "myReviewDocKey": FieldValue.arrayRemove([review.bookDocKey])
    });
    _batch.update(_bookRef, {
      "starUserKey": FieldValue.arrayRemove([review.userKey]),
      "starRating": FieldValue.increment(-review.starRating),
    });
    if (!review.favoriteRating.isNaN) {
      _batch.update(_bookRef, {
        "favoriteUserKey": FieldValue.arrayRemove([review.userKey]),
        "favoriteRating": FieldValue.increment(-review.favoriteRating),
      });
    }
    await _batch.commit();
  }

  Future createReview({
    required Review review,
  }) async {
    final DocumentReference<Map<String, dynamic>> _reviewRef = _firestore
        .collection(collectionBook)
        .doc(review.bookDocKey)
        .collection(collectionReview)
        .doc();
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(review.bookDocKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(review.userKey);
    final _snapshot = await _reviewRef.get();
    final _toWrite = review.copyWith(docKey: _snapshot.id);
    final _batch = _firestore.batch();
    _batch.set(_reviewRef, _toWrite.toJson());
    _batch.update(_activityRef, {
      "myReviewDocKey": FieldValue.arrayUnion([review.bookDocKey])
    });
    _batch.update(_bookRef, {
      "starUserKey": FieldValue.arrayUnion([review.userKey]),
      "starRating": FieldValue.increment(review.starRating),
    });
    if (review.favoriteRating != 0.0) {
      _batch.update(_bookRef, {
        "favoriteUserKey": FieldValue.arrayUnion([review.userKey]),
        "favoriteRating": FieldValue.increment(review.favoriteRating),
      });
    }

    await _batch.commit();
  }
}
