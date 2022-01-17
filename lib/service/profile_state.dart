import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/profile_model.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/repository/profile_repo.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';

class ProfileState extends ChangeNotifier {
  final ProfileRepo _profileRepo = ProfileRepo();
  bool _isDrawer = false;
  ProfileModel? _profileModel;

  Future getUserReviewAndProfile({
    required String userKey,
  }) async {
    _profileModel =
        await _profileRepo.getUserReviewAndProfile(userKey: userKey);
    notifyListeners();
  }

  void openAndCloseDrawer({
    required bool value,
  }) {
    _isDrawer = value;
    notifyListeners();
  }

  bool get isDrawer => _isDrawer;
  ProfileModel? get profileModel => _profileModel;
}
