import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/book_review_model.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_information.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/auth_repo.dart';
import 'package:flutter_gunggeumhany/repository/recommend_repo.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart' as kakao;
import 'package:url_launcher/url_launcher.dart';

class AuthState extends ChangeNotifier {
  final f.FirebaseAuth _firebaseAuth = f.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final AuthRepo _authRepo = AuthRepo();
  final RecommendRepo _recommendRepo = RecommendRepo();
  bool _isLogin = false;
  UserProfile? _userProfile;
  UserActivity? _userActivity;
  List<BookReviewUser> _userBookReview = [];
  bool _isKakaoLogin = false;
  bool _isGoogleLogin = false;

  AuthState() {
    userChecked();
  }

  Future userChecked() async {
    _isLogin = true;
    notifyListeners();
    final _firebaseUser = _firebaseAuth.currentUser;
    final bool _googleUser = await _googleSignIn.isSignedIn();
    final kakao.OAuthToken? _kakaoToken =
        await kakao.TokenManagerProvider.instance.manager.getToken();
    if (_firebaseUser != null && _googleUser) {
      await getMyUserModel(userKey: _firebaseUser.uid);
      if (_userProfile != null && _userActivity != null) {
        if (!_userProfile!.socialProfileImageUrl
            .contains(_firebaseUser.photoURL!)) {
          await _signInStateUpdateSoicalUserImage(
              user: _userProfile!,
              newSocialProfileImageUrl: _firebaseUser.photoURL!);
        }
        await getMainFeedUserReviewListUpdate(userKey: _userProfile!.userKey);
      } else {
        _userProfile = null;
        _userActivity = null;
        _isLogin = false;
        notifyListeners();
      }
    } else if (_kakaoToken != null) {
      final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
      await getMyUserModel(
          userKey: _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
      if (_userProfile != null && _userActivity != null) {
        if (!_userProfile!.socialProfileImageUrl
            .contains(_kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
          await _signInStateUpdateSoicalUserImage(
              user: _userProfile!,
              newSocialProfileImageUrl:
                  _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!);
        }
        await getMainFeedUserReviewListUpdate(userKey: _userProfile!.userKey);
      } else {
        _userProfile = null;
        _userActivity = null;
        _isLogin = false;
        notifyListeners();
      }
    } else {
      _userProfile = null;
      _userActivity = null;
      _isLogin = false;
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

  Future getMyUserModel({
    required String userKey,
  }) async {
    await _getMyProfile(userKey: userKey);
    await _getMyActivity(userKey: userKey);
  }

  Future _getMyActivity({
    required String userKey,
  }) async {
    _userActivity = await _authRepo.getMyActivity(userKey: userKey);
    notifyListeners();
  }

  Future _getMyProfile({
    required String userKey,
  }) async {
    _userProfile = await _authRepo.getCurrentUserProfile(userKey: userKey);
    notifyListeners();
  }

  Future signOut({
    required String provider,
  }) async {
    if (provider == "GOOGLE") {
      _firebaseAuth.signOut();
      _googleSignIn.signOut();
      _userProfile = null;
      _userActivity = null;
      notifyListeners();
    } else if (provider == "KAKAO") {
      await kakao.UserApi.instance.logout();
      await kakao.TokenManagerProvider.instance.manager.clear();
      _userProfile = null;
      _userActivity = null;
      notifyListeners();
    }
  }

  Future signInWithKakao({
    required BuildContext context,
  }) async {
    _isKakaoLogin = true;
    notifyListeners();
    final _installed = await kakao.isKakaoTalkInstalled();
    if (!_installed) {
      const _kakaoMarket = "market://details?id=" + "com.kakao.talk";
      if (await canLaunch(_kakaoMarket)) {
        await launch(_kakaoMarket);
      } else {
        throw 'error';
      }

      _isKakaoLogin = false;
      notifyListeners();
    } else {
      try {
        final _code = await kakao.AuthCodeClient.instance.requestWithTalk();
        final _token = await kakao.AuthApi.instance.issueAccessToken(_code);
        await kakao.TokenManagerProvider.instance.manager.setToken(_token);
        final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
        if (_kakaoUser.kakaoAccount != null) {
          final _resultUser = await _authRepo.getCurrentUserProfile(
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
          if (_resultUser == null) {
            _createNewUserModel(
                provider: 'KAKAO',
                email: _kakaoUser.kakaoAccount!.email!,
                userKey:
                    _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!,
                socialProfileImageUrl:
                    _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!);
          }
          await userChecked();
          _isKakaoLogin = false;
          notifyListeners();
        }
      } catch (error) {
        appFlushbar(message: '서버 에러가 발생 했습니다. 잠시 후 다시 이용해 주세요').show(context);
        _isKakaoLogin = false;
        notifyListeners();
      }
    }
  }

  Future signInWithFacebook({
    required BuildContext context,
  }) async {}

  Future signInWithGoogle({
    required BuildContext context,
  }) async {
    _isGoogleLogin = true;
    notifyListeners();
    try {
      final _googleSignInUser = await _googleSignIn.signIn();
      if (_googleSignInUser == null) {
        appFlushbar(message: '구글 계정을 가져올 수 없습니다').show(context);
        _isGoogleLogin = false;
        notifyListeners();
      } else {
        final _authentication = await _googleSignInUser.authentication;
        final _authCredential = f.GoogleAuthProvider.credential(
          idToken: _authentication.idToken,
          accessToken: _authentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(_authCredential);
        final f.User? _firebaseUser = _firebaseAuth.currentUser;
        if (_firebaseUser != null) {
          final _resultUser =
              await _authRepo.getCurrentUserProfile(userKey: _firebaseUser.uid);
          if (_resultUser == null) {
            await _createNewUserModel(
                provider: 'GOOGLE',
                email: _firebaseUser.email!,
                userKey: _firebaseUser.uid,
                socialProfileImageUrl: _firebaseUser.photoURL!);
          }
          await userChecked();
          _isGoogleLogin = false;
          notifyListeners();
        }
      }
    } catch (error) {
      appFlushbar(message: '서버 에러가 발생 했습니다. 잠시 후 다시 이용해 주세요').show(context);
      _isGoogleLogin = false;
      notifyListeners();
    }
  }

  Future _createNewUserModel({
    required String userKey,
    required String socialProfileImageUrl,
    required String provider,
    required String email,
  }) async {
    await _authRepo.createNewUserProfile(
      userProfile: UserProfile(
        provider: provider,
        userKey: userKey,
        nickName: email.split("@")[0] +
            DateTime.now().millisecondsSinceEpoch.toString(),
        presentProfileImageUrl: socialProfileImageUrl,
        socialProfileImageUrl: socialProfileImageUrl,
        profileImageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutter-gunggeumhany-eef52.appspot.com/o/contant%2Fuser.png?alt=media&token=33cc9343-e3e4-4f56-99d3-26eda3477173",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      userActivity: UserActivity.empty(),
      userInformation: UserInformation.empty(),
    );
  }

  Future<void> _signInStateUpdateSoicalUserImage({
    required UserProfile user,
    required String newSocialProfileImageUrl,
  }) async {
    await _authRepo.updateSoicalProfileImageUrl(
      userKey: user.userKey,
      newSocialProfileImageUrl: newSocialProfileImageUrl,
      presentProfileImageUrl: user.presentProfileImageUrl,
    );
    await getMyUserModel(userKey: user.userKey);
  }

  UserProfile? get userProfile => _userProfile;
  UserActivity? get userActivity => _userActivity;
  List<BookReviewUser> get userBookReview => _userBookReview;
  bool get isKakaoLogin => _isKakaoLogin;
  bool get isGoogleLogin => _isGoogleLogin;
  bool get isLogin => _isLogin;
}
