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
    required double starRating,
    required double favoriteRating,
    required String contents,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _Review;
  const Review._();
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.empty() => Review(
        docKey: "",
        bookDocKey: "",
        userKey: "",
        starRating: 0.0,
        favoriteRating: 0.0,
        contents: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
