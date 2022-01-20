import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activity.freezed.dart';
part 'user_activity.g.dart';

@freezed
class UserActivity with _$UserActivity {
  const factory UserActivity({
    required String userKey,
    required List<String> bookmarkBookDocKey,
    required List<String> myReviewDocKey,
    required List<String> reviewInStarDocKey,
    required double reviewInStarRating,
    required List<String> reviewInFavoriteDocKey,
    required double reviewInFavoriteRating,
  }) = _UserActivity;
  const UserActivity._();
  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);

  factory UserActivity.empty() => const UserActivity(
        userKey: "",
        bookmarkBookDocKey: [],
        myReviewDocKey: [],
        reviewInStarDocKey: [],
        reviewInStarRating: 0.0,
        reviewInFavoriteDocKey: [],
        reviewInFavoriteRating: 0.0,
      );
}
