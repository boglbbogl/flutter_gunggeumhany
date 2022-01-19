import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/aladin_editor_category.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/bestseller_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/new_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/recommend_book_repo.dart';

class AladinState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();
  final NewBookRepo _newBookRepo = NewBookRepo();
  final RecommendBookRepo _recommendBookRepo = RecommendBookRepo();

  bool _isBestsellerLoading = false;
  bool _isBestsellerForeignLoading = false;
  bool _isNewBookLoading = false;
  bool _isSpecialNewBookLoading = false;
  bool _isRecommendBlogLoading = false;
  bool _isRecommendEditorFirstLoading = false;
  bool _isRecommendEditorSecondLoading = false;

  Future aladinBestsellerToFirestoreLogic() async {
    _isBestsellerLoading = true;
    notifyListeners();
    final List<String> _bestsellerISBN =
        await _bestsellerRepo.getAladinBestsellerISBN();
    await _bestsellerRepo.bestsellerAladinISBNReCallKakaoBook(
        aladinISBN: _bestsellerISBN);
    _isBestsellerLoading = false;
    notifyListeners();
  }

  Future aladinBestsellerForeignToFirestoreLogic() async {
    _isBestsellerForeignLoading = true;
    notifyListeners();
    final List<String> _bestsellerForeignISBN =
        await _bestsellerRepo.getAladinBestsellerForeignISBN();
    await _bestsellerRepo.bestsellerForeignAladinISBNReCallKakaoBook(
        aladinISBN: _bestsellerForeignISBN);
    _isBestsellerForeignLoading = false;
    notifyListeners();
  }

  Future aladinNewBookToFirestoreLogic() async {
    _isNewBookLoading = true;
    notifyListeners();
    final List<String> _newBookISBN = await _newBookRepo.getAladinNewBookISBN();
    await _newBookRepo.newBookAladinISBNReCallKakaoBook(
        aladinISBN: _newBookISBN);
    _isNewBookLoading = false;
    notifyListeners();
  }

  Future aladinSpecialNewBookToFirestoreLogic() async {
    _isSpecialNewBookLoading = true;
    notifyListeners();
    final List<String> _specialNewBookISBN =
        await _newBookRepo.getAladinSpecialNewBookISBN();
    await _newBookRepo.specialNewBookAladinISBNReCallKakaoBook(
        aladinISBN: _specialNewBookISBN);
    _isSpecialNewBookLoading = false;
    notifyListeners();
  }

  Future aladinRecommendBlogToFirestoreLogic() async {
    _isRecommendBlogLoading = true;
    notifyListeners();
    final List<String> _recommendBolgNewBookISBN =
        await _recommendBookRepo.getAladinRecommendBlogISBN();
    await _recommendBookRepo.recommendBlogAladinISBNReCallKakaoBook(
        aladinISBN: _recommendBolgNewBookISBN);
    _isRecommendBlogLoading = false;
    notifyListeners();
  }

  Future aladinRecommendEditorFistToFirestoreLogic() async {
    _isRecommendEditorFirstLoading = true;
    notifyListeners();
    final List<String> _recommendEditorNewBookISBN = await _recommendBookRepo
        .getAladinRecommendEidtorISBN(category: aladinCategoryItemFirst);
    final List<String> _toSetRecommendEditorNewBookISBN =
        _recommendEditorNewBookISBN.toSet().toList();
    await _recommendBookRepo.recommendEditorAladinISBNReCallKakaoBook(
        aladinISBN: _toSetRecommendEditorNewBookISBN);
    _isRecommendEditorFirstLoading = false;
    notifyListeners();
  }

  Future aladinRecommendEditorSecondToFirestoreLogic() async {
    _isRecommendEditorSecondLoading = true;
    notifyListeners();
    final List<String> _recommendEditorNewBookISBN = await _recommendBookRepo
        .getAladinRecommendEidtorISBN(category: aladinCategoryItemSecond);
    final List<String> _toSetRecommendEditorNewBookISBN =
        _recommendEditorNewBookISBN.toSet().toList();
    await _recommendBookRepo.recommendEditorAladinISBNReCallKakaoBook(
        aladinISBN: _toSetRecommendEditorNewBookISBN);
    _isRecommendEditorSecondLoading = false;
    notifyListeners();
  }

  bool get isBestsellerLoading => _isBestsellerLoading;
  bool get isBestsellerForeignLoading => _isBestsellerForeignLoading;
  bool get isNewBookLoading => _isNewBookLoading;
  bool get isSpecialNewBookLoading => _isSpecialNewBookLoading;
  bool get isRecommendBlogLoading => _isRecommendBlogLoading;
  bool get isRecommendEditorFirstLoading => _isRecommendEditorFirstLoading;
  bool get isRecommendEditorSecondLoading => _isRecommendEditorSecondLoading;
}
