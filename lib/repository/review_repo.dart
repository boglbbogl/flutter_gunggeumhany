import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
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

  Future requestReviewBlocked({
    required ReviewBlocked reviewBlocked,
  }) async {
    final DocumentReference<Map<String, dynamic>> _blockedRef =
        _firestore.collection(collectionBlocked).doc();
    final _blockedSnapshot = await _blockedRef.get();
    final _toWrite = reviewBlocked.copyWith(docKey: _blockedSnapshot.id);
    await _blockedRef.set(_toWrite.toJson());
  }

  Future myReviewListblockedReview({
    required String myUserKey,
    required String reviewDocKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userActivityRef =
        _firestore.collection(collectionUserActivity).doc(myUserKey);
    final _batch = _firestore.batch();
    _batch.update(_userActivityRef, {
      "blockedReviewDocKey": FieldValue.arrayUnion([reviewDocKey]),
    });
    await _batch.commit();
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
    if (!review.starRating.isNaN) {
      _batch.update(_activityRef, {
        "reviewInStarDocKey": FieldValue.arrayRemove([review.bookDocKey]),
        "reviewInStarRating": FieldValue.increment(-review.starRating),
      });
    }
    if (!review.favoriteRating.isNaN) {
      _batch.update(_activityRef, {
        "reviewInFavoriteDocKey": FieldValue.arrayRemove([review.bookDocKey]),
        "reviewInFavoriteRating": FieldValue.increment(-review.favoriteRating),
      });
    }
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
    if (!review.starRating.isNaN) {
      _batch.update(_activityRef, {
        "reviewInStarDocKey": FieldValue.arrayUnion([review.bookDocKey]),
        "reviewInStarRating": FieldValue.increment(review.starRating),
      });
    }
    if (!review.favoriteRating.isNaN) {
      _batch.update(_activityRef, {
        "reviewInFavoriteDocKey": FieldValue.arrayUnion([review.bookDocKey]),
        "reviewInFavoriteRating": FieldValue.increment(review.favoriteRating),
      });
    }
    _batch.set(_reviewRef, _toWrite.toJson());
    _batch.update(_activityRef, {
      "myReviewDocKey": FieldValue.arrayUnion([review.bookDocKey]),
    });
    _batch.update(_bookRef, {
      "starUserKey": FieldValue.arrayUnion([review.userKey]),
      "starRating": FieldValue.increment(review.starRating),
      "lastReviewCreatedAt": DateTime.now().toIso8601String(),
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
