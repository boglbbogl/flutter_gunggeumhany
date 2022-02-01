import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:flutter_gunggeumhany/repository/preference_repo.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';

class PreferenceState extends ChangeNotifier {
  final PreferenceRepo _preferenceRepo = PreferenceRepo();
  List<Book> _bookList = [];
  List<PreferenceModel> _createPreferList = [];
  bool _isLoading = false;

  Future createUserPreferenceResearch({
    required String userKey,
    required BuildContext context,
  }) async {
    if (_createPreferList.isEmpty) {
      appFlushbar(message: '입력한 별점이 없습니다').show(context);
    }
    await _preferenceRepo.createUserPreferenceResearch(
        preferList: _createPreferList, userKey: userKey);
    _createPreferList.clear();
    notifyListeners();
  }

  void started() {
    _createPreferList = [];
  }

  void starRatingCreateItem({
    required PreferenceModel preferenceModel,
  }) {
    if (_createPreferList
        .map((e) => e.isbn13)
        .contains(preferenceModel.isbn13)) {
      if (preferenceModel.starRating == 0.0) {
        _createPreferList.removeWhere(
            (element) => preferenceModel.isbn13.contains(element.isbn13));
      } else {
        _createPreferList.removeWhere(
            (element) => preferenceModel.isbn13.contains(element.isbn13));
        _createPreferList.add(preferenceModel);
      }
    } else {
      _createPreferList.add(preferenceModel);
    }
  }

  Future getPreferenceModel({
    required String userKey,
  }) async {
    _isLoading = true;
    notifyListeners();
    _bookList = await _preferenceRepo.getPreferenceModel(userKey: userKey);
    _isLoading = false;
    notifyListeners();
  }

  List<Book> get bookList => _bookList;
  bool get isLoading => _isLoading;
}
