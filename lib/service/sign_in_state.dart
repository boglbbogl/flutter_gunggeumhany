import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_information.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/auth_repo.dart';

class SignInState extends ChangeNotifier {
  final f.FirebaseAuth _firebaseAuth = f.FirebaseAuth.instance;
  final AuthRepo _authRepo = AuthRepo();
  bool _isSignIn = false;

  Future signInWithEmailAndPassword() async {}
  Future signInWithAnnoymouse() async {
    _isSignIn = true;
    notifyListeners();
    final f.UserCredential _user = await _firebaseAuth.signInAnonymously();
    if (_user.user != null) {
      await _authRepo.createNewUserProfile(
        userProfile: UserProfile(
          userKey: _user.user!.uid,
          nickName: DateTime.now().millisecondsSinceEpoch.toString(),
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutter-gunggeumhany-eef52.appspot.com/o/contant%2Fuser.png?alt=media&token=33cc9343-e3e4-4f56-99d3-26eda3477173",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        userActivity: UserActivity.empty(),
        userInformation: UserInformation.empty(),
      );
    }
    _isSignIn = false;
    notifyListeners();
  }

  bool get isSignIn => _isSignIn;
}
