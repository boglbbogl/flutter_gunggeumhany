import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/repository/preference_repo.dart';

class PreferenceState extends ChangeNotifier {
  final PreferenceRepo _preferenceRepo = PreferenceRepo();

  PreferenceState({
    required String userKey,
  }) {
    getPreferenceModel(userKey: userKey);
  }

  Future getPreferenceModel({
    required String userKey,
  }) async {
    await _preferenceRepo.getPreferenceModel(userKey: userKey);
  }
}
