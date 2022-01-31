import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:flutter_gunggeumhany/model/user_information.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/state/core/logger.dart';

class PreferenceRepo {
  static final PreferenceRepo _preferenceRepo = PreferenceRepo._internal();
  factory PreferenceRepo() => _preferenceRepo;
  PreferenceRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PreferenceModel>> getPreferenceModel({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userInfoRef =
        _firestore.collection(collectionUserInformation).doc(userKey);
    final _userInfoSnapshot = await _userInfoRef.get();
    final UserInformation _userInfo =
        UserInformation.fromJson(_userInfoSnapshot.data()!);
    final List<String> _referISBN13 =
        _userInfo.preference.map((e) => e.isbn13).toList();
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _bookList = await _bookRef.get().then((value) => value.docs
        .where((element) => !_referISBN13.contains(element.data()["isbn13"]))
        .map((e) => Book.fromJson(e.data()))
        .toList());
    logger.e(_bookList);
    return [];
  }
}
