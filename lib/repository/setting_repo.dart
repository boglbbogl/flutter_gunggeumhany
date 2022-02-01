import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_gunggeumhany/model/customer_service.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class SettingRepo {
  static final SettingRepo _settingRepo = SettingRepo._internal();
  factory SettingRepo() => _settingRepo;
  SettingRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<CustomerService>> getCustomerService({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _customerServiceRef =
        _firestore.collection(collectionCustomerService);
    final _result = await _customerServiceRef
        .where("userKey", isEqualTo: userKey)
        .get()
        .then((value) =>
            value.docs.map((e) => CustomerService.fromJson(e.data())).toList());
    return _result;
  }

  Future setRequestCustomerServices({
    required CustomerService customerService,
  }) async {
    final DocumentReference<Map<String, dynamic>> _customerServiceRef =
        _firestore.collection(collectionCustomerService).doc();
    final _customerServiceSnapshot = await _customerServiceRef.get();
    final _toWrite = customerService.copyWith(docKey: _customerServiceRef.id);
    if (!_customerServiceSnapshot.exists) {
      await _customerServiceRef.set(_toWrite.toJson());
    }
  }

  Future updateUserProfile({
    required String userKey,
    required String imageUrl,
    required String nickName,
    required bool isChangedSocial,
    required String presentImageUrl,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUserProfile).doc(userKey);
    final _batch = _firestore.batch();
    if (isChangedSocial) {
      _batch.update(_userRef, {
        "presentProfileImageUrl": presentImageUrl,
        "updatedAt": DateTime.now(),
      });
    }
    if (nickName.isNotEmpty) {
      _batch.update(_userRef, {
        "nickName": nickName,
        "updatedAt": DateTime.now(),
      });
    }
    if (imageUrl.isNotEmpty) {
      _batch.update(_userRef, {
        "profileImageUrl": imageUrl,
        "updatedAt": DateTime.now(),
      });
    }
    await _batch.commit();
  }

  Future<bool> duplicationValidateNickName({
    required String nickName,
  }) async {
    final CollectionReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUserProfile);
    final _usersNickName = await _userRef
        .where('nickName')
        .get()
        .then((value) => value.docs.map((e) => e.data()['nickName']));
    return _usersNickName.contains(nickName);
  }

  Future<String> userProfileImageUpladResized({
    required Uint8List image,
    required String userKey,
  }) async {
    final String _dateTime = DateTime.now().millisecondsSinceEpoch.toString();
    final appDocDir = await getApplicationDocumentsDirectory();
    final Image? _decodedImage = decodeImage(image);
    final Image _resizedImage =
        copyResize(_decodedImage!, width: 512, height: 512);

    const fileName = '512.jpg';
    final _fileTask = File("${appDocDir.path}/$fileName")
        .writeAsBytes(encodeJpg(_resizedImage));
    final _file = await _fileTask;
    final _imageRef = "user_profile/${userKey}_$_dateTime/0";

    await _storage.ref(_imageRef).putFile(_file);
    final _url = await _storage.ref(_imageRef).getDownloadURL();
    return _url;
  }
}
