import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/book_review_model.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/auth_repo.dart';
import 'package:flutter_gunggeumhany/repository/recommend_repo.dart';

class AuthState extends ChangeNotifier {
  final f.FirebaseAuth _firebaseAuth = f.FirebaseAuth.instance;
  final AuthRepo _authRepo = AuthRepo();
  final RecommendRepo _recommendRepo = RecommendRepo();
  UserProfile? _userProfile;
  UserActivity? _userActivity;
  List<BookReviewUser> _userBookReview = [];

  AuthState() {
    userChecked();
  }
  Future userChecked() async {
    final _firebaseUser = _firebaseAuth.currentUser;
    if (_firebaseUser != null) {
      await getMyProfile(userKey: _firebaseUser.uid);
      await getMyActivity(userKey: _firebaseUser.uid);
      if (_userProfile != null && _userActivity != null) {
        await getMainFeedUserReviewListUpdate(userKey: _userProfile!.userKey);
      }

      notifyListeners();
    } else {
      _userProfile = null;
      _userActivity = null;
      notifyListeners();
    }
  }

  Future getMainFeedUserReviewListUpdate({
    required String userKey,
  }) async {
    _userBookReview = await _recommendRepo.getMainFeedCurrentUserPresentReview(
        userKey: userKey);
    notifyListeners();
  }

  Future getMyActivity({
    required String userKey,
  }) async {
    _userActivity = await _authRepo.getMyActivity(userKey: userKey);
    notifyListeners();
  }

  Future getMyProfile({
    required String userKey,
  }) async {
    _userProfile = await _authRepo.getCurrentUserProfile(userKey: userKey);
    notifyListeners();
  }

  Future signOut() async {
    _firebaseAuth.signOut();
    _userProfile = null;
    _userActivity = null;
    notifyListeners();
  }

  UserProfile? get userProfile => _userProfile;
  UserActivity? get userActivity => _userActivity;
  List<BookReviewUser> get userBookReview => _userBookReview;
}
