import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/service/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String docKey,
    required String bookDocKey,
    required String userKey,
    required bool isBlocked,
    required double starRating,
    required double favoriteRating,
    required String contents,
    required String bookTitle,
    required List<String> bookAuthors,
    @TimestampConverter() required DateTime createdAt,
  }) = _Review;
  const Review._();
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.empty() => Review(
        docKey: "",
        bookDocKey: "",
        userKey: "",
        isBlocked: false,
        starRating: 0.0,
        favoriteRating: 0.0,
        contents: "",
        createdAt: DateTime.now(),
        bookAuthors: [],
        bookTitle: "",
      );
}

@freezed
class ReviewBlocked with _$ReviewBlocked {
  const factory ReviewBlocked({
    required String classification,
    required String userKey,
    required String docKey,
    required bool isChecked,
    required String blockedUserKey,
    required String bookDocKey,
    required String reviewDocKey,
    required String category,
    @TimestampConverter() required DateTime createdAt,
  }) = _ReviewBlocked;
  const ReviewBlocked._();
  factory ReviewBlocked.fromJson(Map<String, dynamic> json) =>
      _$ReviewBlockedFromJson(json);
  factory ReviewBlocked.empty() => ReviewBlocked(
        classification: "",
        userKey: "",
        docKey: "",
        isChecked: false,
        blockedUserKey: "",
        bookDocKey: "",
        reviewDocKey: "",
        category: "",
        createdAt: DateTime.now(),
      );
}
