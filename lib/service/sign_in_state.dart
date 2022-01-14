import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/material.dart';
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
        nickName: "",
        imageUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    }
    _isSignIn = false;
    notifyListeners();
  }

  bool get isSignIn => _isSignIn;
}
