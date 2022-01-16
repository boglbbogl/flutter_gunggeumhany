import 'package:flutter/cupertino.dart';

class ReviewState extends ChangeNotifier {
  double _starRating = 0;
  double _favoriteRating = 0;
  String _reviewContents = "";

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
}
