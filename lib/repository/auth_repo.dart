import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_information.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class AuthRepo {
  static final AuthRepo _userRepo = AuthRepo._internal();
  factory AuthRepo() => _userRepo;
  AuthRepo._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserProfile?> getCurrentUserProfile({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final _result = await _userRef.get();
    if (_result.exists) {
      final UserProfile _userProfile = UserProfile.fromJson(_result.data()!);
      return _userProfile;
    } else {
      return null;
    }
  }

  Future<UserActivity?> getMyActivity({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userKey);
    final _result = await _activityRef.get();
    if (_result.exists) {
      final UserActivity _userActivity = UserActivity.fromJson(_result.data()!);
      return _userActivity;
    } else {
      return null;
    }
  }

  Future createNewUserProfile({
    required UserProfile userProfile,
    required UserActivity userActivity,
    required UserInformation userInformation,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userProfile.userKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionUserActivity).doc(userProfile.userKey);
    final DocumentReference<Map<String, dynamic>> _infomationRef = _firestore
        .collection(collectionUserInformation)
        .doc(userProfile.userKey);
    final _batch = _firestore.batch();
    final _activityToWrite =
        userActivity.copyWith(userKey: userProfile.userKey);
    final _informationToWrite =
        userInformation.copyWith(userKey: userProfile.userKey);
    _batch.set(_infomationRef, _informationToWrite.toJson());
    _batch.set(_activityRef, _activityToWrite.toJson());
    _batch.set(_userRef, userProfile.toJson());
    await _batch.commit();
  }
}
