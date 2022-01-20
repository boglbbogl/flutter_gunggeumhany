import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_user.freezed.dart';
part 'review_user.g.dart';

@freezed
class ReviewUser with _$ReviewUser {
  const factory ReviewUser({
    required Review review,
    required UserProfile userProfile,
  }) = _ReviewUser;
  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);
}

@freezed
class BookReviewUser with _$BookReviewUser {
  const factory BookReviewUser({
    required Book book,
    required Review review,
  }) = _BookReviewUser;
}
