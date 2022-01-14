import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/auth_repo.dart';

class AuthState extends ChangeNotifier {
  final f.FirebaseAuth _firebaseAuth = f.FirebaseAuth.instance;
  final AuthRepo _authRepo = AuthRepo();
  UserProfile? _userProfile;

  AuthState() {
    userChecked();
  }
  Future userChecked() async {
    final _firebaseUser = _firebaseAuth.currentUser;
    if (_firebaseUser != null) {
      _userProfile =
          await _authRepo.getCurrentUserProfile(userKey: _firebaseUser.uid);
      notifyListeners();
    } else {
      _userProfile = null;
      notifyListeners();
    }
  }

  Future signOut() async {
    _firebaseAuth.signOut();
    _userProfile = null;
    notifyListeners();
  }

  UserProfile? get userProfile => _userProfile;
}
