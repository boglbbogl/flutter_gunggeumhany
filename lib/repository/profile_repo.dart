import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/profile_model.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class ProfileRepo {
  static final ProfileRepo _profileRepo = ProfileRepo._internal();
  factory ProfileRepo() => _profileRepo;
  ProfileRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileModel> getUserReviewAndProfile({
    required String userKey,
  }) async {
    final List<Review> _review = [];
    final List<Book> _book = [];
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userKey);
    final _userSnapshot = await _userRef.get();
    final _activitySnapshot = await _activityRef.get();
    final UserProfile _userProfile =
        UserProfile.fromJson(_userSnapshot.data()!);
    final UserActivity _userActivity =
        UserActivity.fromJson(_activitySnapshot.data()!);
    for (final element in _userActivity.bookmarkBookDocKey) {
      final _bookRef = _firestore.collection(collectionBook).doc(element);
      final _bookSnapshot = await _bookRef.get();
      if (_bookSnapshot.exists) {
        final _bookResult = Book.fromJson(_bookSnapshot.data()!);
        _book.add(_bookResult);
      }
    }
    if (_userActivity.myReviewDocKey.isNotEmpty) {
      for (final element in _userActivity.myReviewDocKey) {
        final _reviewRef = _firestore
            .collection(collectionBook)
            .doc(element)
            .collection(collectionReview);
        final _reviewResult = await _reviewRef.get().then((value) {
          return value.docs
              .where((element) => element.data()["userKey"] == userKey)
              .map((e) => Review.fromJson(e.data()))
              .toList()[0];
        });
        _review.add(_reviewResult);
      }
    }

    final ProfileModel _result =
        ProfileModel(userProfile: _userProfile, review: _review, book: _book);
    return _result;
  }
}
