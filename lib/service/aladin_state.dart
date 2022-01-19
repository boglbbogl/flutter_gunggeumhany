import 'package:flutter/material.dart';
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
  bool _isRecommendEditorLoading = false;

  Future aladinBestsellerToFirestoreLogic() async {
    _isBestsellerLoading = true;
    notifyListeners();
    await _bestsellerRepo.bestsellerAladinISBNReCallKakaoBook();
    _isBestsellerLoading = false;
    notifyListeners();
  }

  Future aladinBestsellerForeignToFirestoreLogic() async {
    _isBestsellerForeignLoading = true;
    notifyListeners();
    await _bestsellerRepo.bestsellerForeignAladinISBNReCallKakaoBook();
    _isBestsellerForeignLoading = false;
    notifyListeners();
  }

  Future aladinNewBookToFirestoreLogic() async {
    _isNewBookLoading = true;
    notifyListeners();
    await _newBookRepo.newBookAladinISBNReCallKakaoBook();
    _isNewBookLoading = false;
    notifyListeners();
  }

  Future aladinSpecialNewBookToFirestoreLogic() async {
    _isSpecialNewBookLoading = true;
    notifyListeners();

    await _newBookRepo.specialNewBookAladinISBNReCallKakaoBook();
    _isSpecialNewBookLoading = false;
    notifyListeners();
  }

  Future aladinRecommendBlogToFirestoreLogic() async {
    _isRecommendBlogLoading = true;
    notifyListeners();
    await _recommendBookRepo.recommendBlogAladinISBNReCallKakaoBook();
    _isRecommendBlogLoading = false;
    notifyListeners();
  }

  Future recommendEditorAladinISBNReCallKakaoBook() async {
    _isRecommendEditorLoading = true;
    notifyListeners();
    await _recommendBookRepo.recommendEditorAladinISBNReCallKakaoBook();
    _isRecommendEditorLoading = false;
    notifyListeners();
  }

  bool get isBestsellerLoading => _isBestsellerLoading;
  bool get isBestsellerForeignLoading => _isBestsellerForeignLoading;
  bool get isNewBookLoading => _isNewBookLoading;
  bool get isSpecialNewBookLoading => _isSpecialNewBookLoading;
  bool get isRecommendBlogLoading => _isRecommendBlogLoading;
  bool get isRecommendEditorLoading => _isRecommendEditorLoading;
}
