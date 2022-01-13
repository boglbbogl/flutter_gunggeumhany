import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/user.dart';

class AuthState extends ChangeNotifier {
  User? _user;
  AuthState() {
    _userChecked();
  }
  Future _userChecked() async {}
  User? get user => _user!;
}
