import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/aladin_theme_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/recommend_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/book/book_none_repo.dart';

class AladinState extends ChangeNotifier {
  final AladinThemeRepo _aladinThemeRepo = AladinThemeRepo();
  final AladinCategoryRepo _aladinCategoryRepo = AladinCategoryRepo();
  final BookNoneRepo _bookNoneRepo = BookNoneRepo();

  bool _isBestsellerLoading = false;
  bool _isBestsellerForeignLoading = false;
  bool _isSpecialNewBookLoading = false;
  bool _isRecommendBlogLoading = false;
  bool _isRecommendEditorLoading = false;
  bool _isContentsNoneLoading = false;
  bool _isThumbnailNoneLoading = false;

  Future contentsNoneFieldAdd() async {
    _isContentsNoneLoading = true;
    notifyListeners();
    await _bookNoneRepo.noneFieldAddProviderAladin(
        updateData: "contents", aladinParameter: "description");
    _isContentsNoneLoading = false;
    notifyListeners();
  }

  Future thumbnailNoneFieldAdd() async {
    _isThumbnailNoneLoading = true;
    notifyListeners();
    await _bookNoneRepo.noneFieldAddProviderAladin(
        updateData: "thumbnail", aladinParameter: "cover");

    _isThumbnailNoneLoading = false;
    notifyListeners();
  }

  Future aladinBestsellerToFirestoreLogic() async {
    _isBestsellerLoading = true;
    notifyListeners();
    await _aladinThemeRepo.bestsellerAladinISBNReCallKakaoBook();
    _isBestsellerLoading = false;
    notifyListeners();
  }

  Future aladinBestsellerForeignToFirestoreLogic() async {
    _isBestsellerForeignLoading = true;
    notifyListeners();
    await _aladinThemeRepo.bestsellerForeignAladinISBNReCallKakaoBook();
    _isBestsellerForeignLoading = false;
    notifyListeners();
  }

  Future aladinSpecialNewBookToFirestoreLogic() async {
    _isSpecialNewBookLoading = true;
    notifyListeners();

    await _aladinThemeRepo.specialNewBookAladinISBNReCallKakaoBook();
    _isSpecialNewBookLoading = false;
    notifyListeners();
  }

  Future aladinRecommendBlogToFirestoreLogic() async {
    _isRecommendBlogLoading = true;
    notifyListeners();
    await _aladinCategoryRepo.recommendBlogAladinISBNReCallKakaoBook();
    _isRecommendBlogLoading = false;
    notifyListeners();
  }

  Future recommendEditorAladinISBNReCallKakaoBook() async {
    _isRecommendEditorLoading = true;
    notifyListeners();
    await _aladinCategoryRepo.recommendEditorAladinISBNReCallKakaoBook();
    _isRecommendEditorLoading = false;
    notifyListeners();
  }

  bool get isBestsellerLoading => _isBestsellerLoading;
  bool get isBestsellerForeignLoading => _isBestsellerForeignLoading;
  bool get isSpecialNewBookLoading => _isSpecialNewBookLoading;
  bool get isRecommendBlogLoading => _isRecommendBlogLoading;
  bool get isRecommendEditorLoading => _isRecommendEditorLoading;
  bool get isContentsNoneLoading => _isContentsNoneLoading;
  bool get isThumbnailNoneLoading => _isThumbnailNoneLoading;
}
