import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/profile_model.dart';
import 'package:flutter_gunggeumhany/repository/profile_repo.dart';

class ProfileState extends ChangeNotifier {
  final ProfileRepo _profileRepo = ProfileRepo();
  bool _isDrawer = false;
  bool _isStartLoading = false;
  final List<ProfileModel> _profileModelList = [];

  Future getUserReviewAndProfile({
    required String userKey,
  }) async {
    _isStartLoading = true;
    notifyListeners();
    final ProfileModel _profileModel =
        await _profileRepo.getUserReviewAndProfile(userKey: userKey);

    final ProfileModel? _deleteUserModel = _profileModelList
            .where((element) => userKey.contains(element.userProfile.userKey))
            .toList()
            .isEmpty
        ? null
        : _profileModelList
            .where((element) => userKey.contains(element.userProfile.userKey))
            .toList()[0];
    if (_deleteUserModel != null) {
      _profileModelList.remove(_deleteUserModel);
    }
    _profileModelList.add(_profileModel);
    _isStartLoading = false;
    notifyListeners();
  }

  void openAndCloseDrawer({
    required bool value,
  }) {
    _isDrawer = value;
    notifyListeners();
  }

  bool get isDrawer => _isDrawer;
  bool get isStartLoading => _isStartLoading;
  List<ProfileModel> get profileModelList => _profileModelList;
}
