import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/cupertino.dart';

class AuthState extends ChangeNotifier {
  final f.FirebaseAuth _firebaseAuth = f.FirebaseAuth.instance;
  // User? _user;
  f.User? _firebaseUser;
  // AuthState() {
  //   _userChecked();
  // }
  Future _userChecked() async {}
  Future signInWithEmailAndPassword() async {}
  Future signInWithAnnoymouse() async {
    f.UserCredential _userCredential = await _firebaseAuth.signInAnonymously();
    _firebaseUser = _userCredential.user;
  }

  // User? get user => _user!;
  f.User? get firebaseUser => _firebaseUser;
}
