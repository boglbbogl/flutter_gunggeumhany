import 'package:cloud_firestore/cloud_firestore.dart';
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
    final UserProfile _userProfile = UserProfile.fromJson(_result.data()!);
    return _userProfile;
  }

  Future createNewUserProfile({
    required UserProfile userProfile,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userProfile.userKey);
    final _batch = _firestore.batch();
    _batch.set(_userRef, userProfile.toJson());
    await _batch.commit();
  }
}
