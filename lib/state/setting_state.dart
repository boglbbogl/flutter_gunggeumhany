import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/setting_repo.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';
import 'package:image_picker/image_picker.dart';

class SettingState extends ChangeNotifier {
  final SettingRepo _settingRepo = SettingRepo();
  final ImagePicker _imagePicker = ImagePicker();
  Uint8List? _pickedImage;
  String _changedProfileImageUrl = "";
  bool _isReadOnly = true;
  bool _isUpdate = false;
  bool _isImageSeleted = false;
  bool? _isSocialProfileImage;
  String _changedNickName = "";

  void started({
    required bool isSocial,
  }) {
    _isReadOnly = true;
    _changedNickName = "";
    _changedProfileImageUrl = "";
    _isSocialProfileImage = isSocial;
    _pickedImage = null;
    notifyListeners();
  }

  Future changedProfileImage() async {
    _isImageSeleted = true;
    notifyListeners();

    final XFile? _selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      _pickedImage = await _selectedImage.readAsBytes();
      notifyListeners();
    }
    _isImageSeleted = false;
    notifyListeners();
  }

  Future updateUserProfile({
    required UserProfile userProfile,
    required BuildContext context,
  }) async {
    String _presentImageUrl = "";
    bool _isChangedSocialOrLocalProfile = false;
    if (_changedNickName.isEmpty &&
        _pickedImage == null &&
        _isSocialProfileImage ==
            userProfile.presentProfileImageUrl
                .contains(userProfile.socialProfileImageUrl)) {
      _isChangedSocialOrLocalProfile = false;
      return appFlushbar(message: '변경 사항이 없습니다').show(context);
    }
    _isUpdate = true;
    notifyListeners();
    if (_pickedImage != null) {
      _changedProfileImageUrl = await _settingRepo.userProfileImageUpladResized(
          image: _pickedImage!, userKey: userProfile.userKey);
    }
    if (_isSocialProfileImage !=
        userProfile.presentProfileImageUrl
            .contains(userProfile.socialProfileImageUrl)) {
      if (_isSocialProfileImage!) {
        _presentImageUrl = userProfile.socialProfileImageUrl;
        _isChangedSocialOrLocalProfile = true;
      } else {
        _presentImageUrl = userProfile.profileImageUrl;
        _isChangedSocialOrLocalProfile = true;
      }
    }

    await _settingRepo.updateUserProfile(
        isChangedSocial: _isChangedSocialOrLocalProfile,
        presentImageUrl: _presentImageUrl,
        userKey: userProfile.userKey,
        imageUrl: _changedProfileImageUrl,
        nickName: _changedNickName);

    _isUpdate = false;
    Navigator.of(context)
      ..pop()
      ..pop();
    notifyListeners();
  }

  Future nickNameDuplication({
    required String nickName,
    required BuildContext context,
  }) async {
    if (nickName.length < 21 && nickName.length > 2) {
      final _result =
          await _settingRepo.duplicationValidateNickName(nickName: nickName);
      if (_result) {
        appFlushbar(message: '이미 사용 중인 닉네임 입니다').show(context);
      } else {
        _isReadOnly = true;
        _changedNickName = nickName;
      }
    } else {
      appFlushbar(message: '20자 이내로 닉네임을 만드세요').show(context);
    }

    notifyListeners();
  }

  void selectedIsSocialOrLocalProfileImage({
    required bool value,
  }) {
    _isSocialProfileImage = value;
    notifyListeners();
  }

  void showIsReadOnly({
    required bool value,
  }) {
    _isReadOnly = value;
    notifyListeners();
  }

  bool get isReadOnly => _isReadOnly;
  String get changedNickName => _changedNickName;
  bool get isUpdate => _isUpdate;
  Uint8List? get pickedImage => _pickedImage;
  bool get isImageSelected => _isImageSeleted;
  bool? get isSocialProfileImage => _isSocialProfileImage;
}
