import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/repository/review_repo.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';

class ReviewState extends ChangeNotifier {
  final ReviewRepo _reviewRepo = ReviewRepo();

  final Review _review = Review.empty();
  Review? _myReview;
  double _starRating = 0;
  double _favoriteRating = 0;
  String _reviewContents = "";
  bool _isCreateReview = false;

  void started() {
    _starRating = 0;
    _favoriteRating = 0;
    _reviewContents = "";
    _myReview = null;
  }

  Future getMyReviewList({
    required String bookDocKey,
    required String userKey,
  }) async {
    _myReview =
        await _reviewRepo.getMyReview(bookDocKey: bookDocKey, userKey: userKey);
    notifyListeners();
  }

  Future blokedReview({
    required String category,
    required String myUserKey,
    required String reviewDocKey,
    required String blockedUserKey,
    required String bookDocKey,
    required BuildContext context,
  }) async {
    await _reviewRepo.requestReviewBlocked(
        reviewBlocked: ReviewBlocked(
      classification: "REVIEW",
      userKey: myUserKey,
      docKey: "",
      isChecked: false,
      blockedUserKey: blockedUserKey,
      bookDocKey: bookDocKey,
      reviewDocKey: reviewDocKey,
      category: category,
      createdAt: DateTime.now(),
    ));
    if (category == "나한테 더 이상 리뷰 안보이게 하기") {
      await _reviewRepo.myReviewListblockedReview(
          myUserKey: myUserKey, reviewDocKey: reviewDocKey);
    }
    Navigator.of(context).pop();
    appFlushbar(message: '신고가 접수 되었습니다').show(context);
  }

  Future deleteMyReview({
    required Review review,
    required BuildContext context,
  }) async {
    await _reviewRepo.deleteMyReview(review: review);
    Navigator.of(context).pop();
  }

  Future<bool> createReview({
    required String bookDocKey,
    required String userKey,
    required String bookTitle,
    required List<String> authors,
    required BuildContext context,
  }) async {
    _isCreateReview = true;
    notifyListeners();
    final _isSuccess = await _reviewRepo.createReview(
        review: _review.copyWith(
      bookDocKey: bookDocKey,
      starRating: _starRating,
      favoriteRating: _favoriteRating,
      contents: _reviewContents,
      userKey: userKey,
      createdAt: DateTime.now(),
      bookTitle: bookTitle,
      bookAuthors: authors,
    ));
    if (_isSuccess) {
      _isCreateReview = false;
      notifyListeners();

      return true;
    } else {
      appFlushbar(message: '이미 등록한 리뷰가 있습니다').show(context);
      _isCreateReview = false;
      notifyListeners();

      return false;
    }
  }

  void changedReviewContents({
    required String value,
  }) {
    _reviewContents = value;
    notifyListeners();
  }

  void changedStarRating({
    required double value,
  }) {
    _starRating = value;
    notifyListeners();
  }

  void changedFavoriteRating({
    required double value,
  }) {
    _favoriteRating = value;
    notifyListeners();
  }

  double get starRating => _starRating;
  double get favoriteRating => _favoriteRating;
  String get reviewContents => _reviewContents;
  bool get isCreateReview => _isCreateReview;
  Review? get myReview => _myReview;
}
