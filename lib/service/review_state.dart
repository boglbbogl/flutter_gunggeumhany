import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/review_user.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_flushbar.dart';
import 'package:flutter_gunggeumhany/repository/book_price_repo.dart';
import 'package:flutter_gunggeumhany/repository/review_repo.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';

class ReviewState extends ChangeNotifier {
  final ReviewRepo _reviewRepo = ReviewRepo();
  final BookPriceRepo _bookPriceRepo = BookPriceRepo();
  AladinPrice? _aladinPrice;
  final Review _review = Review.empty();
  List<ReviewUser> _userReviewList = [];
  Review? _myReview;
  double _starRating = 0;
  double _favoriteRating = 0;
  String _reviewContents = "";
  bool _isCreateReview = false;
  bool _isGetReviewListLoading = false;
  bool _isBookPriceLoading = false;

  void started() {
    _starRating = 0;
    _favoriteRating = 0;
    _reviewContents = "";
  }

  Future getAladinPriceInfo({
    required String ISBN13,
    required String ISBN10,
  }) async {
    _aladinPrice =
        await _bookPriceRepo.getAladinPriceInfo(ISBN13: ISBN13, ISBN10: ISBN10);
    logger.e(_aladinPrice);
    notifyListeners();
  }

  Future getUserReviewList({
    required String bookDocKey,
    required String userKey,
    required String ISBN13,
    required String ISBN10,
  }) async {
    _isGetReviewListLoading = true;
    _isBookPriceLoading = true;
    notifyListeners();
    _userReviewList =
        await _reviewRepo.getUserJoinReview(bookDocKey: bookDocKey);

    _myReview = _userReviewList
            .where((e) => userKey.contains(e.userProfile.userKey))
            .toList()
            .isEmpty
        ? null
        : _userReviewList
            .where((e) => userKey.contains(e.userProfile.userKey))
            .toList()[0]
            .review;
    _isGetReviewListLoading = false;
    notifyListeners();

    _aladinPrice =
        await _bookPriceRepo.getAladinPriceInfo(ISBN13: ISBN13, ISBN10: ISBN10);
    _isBookPriceLoading = false;
    notifyListeners();
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

  Future createReview({
    required String bookDocKey,
    required String userKey,
    required String bookTitle,
    required List<String> authors,
    required BuildContext context,
  }) async {
    _isCreateReview = true;
    notifyListeners();

    await _reviewRepo.createReview(
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

    _isCreateReview = false;
    notifyListeners();
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
  List<ReviewUser> get userReviewList => _userReviewList;
  Review? get myReview => _myReview;
  bool get isGetReviewListLoading => _isGetReviewListLoading;
  AladinPrice? get aladinPrice => _aladinPrice;
  bool get isBookPriceLoading => _isBookPriceLoading;
}
