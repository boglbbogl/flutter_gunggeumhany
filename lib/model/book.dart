import 'package:flutter_gunggeumhany/model/review_user.dart';
import 'package:flutter_gunggeumhany/repository/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String? docKey,
    required List<String>? searchKeyWord,
    required List<String>? starUserKey,
    required double? starRating,
    required List<String>? favoriteUserKey,
    required double? favoriteRating,
    required List<String>? bookmarkUserKey,
    required String? isbn10,
    required String? isbn13,
    required bool? isAdult,
    required String? categoryName,
    required List<String>? categoryList,
    required String title,
    required String contents,
    required String url,
    required String isbn,
    required DateTime? datetime,
    @TimestampConverter() required DateTime? createdAt,
    @TimestampConverter() required DateTime? lastReviewCreatedAt,
    required List<String> authors,
    required String publisher,
    required List<String> translators,
    required int price,
    required String thumbnail,
    required List<ReviewUser>? reviewUser,
  }) = _Book;
  const Book._();
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  factory Book.empty() => Book(
        docKey: "",
        searchKeyWord: [],
        starUserKey: [],
        starRating: 0.0,
        favoriteUserKey: [],
        favoriteRating: 0.0,
        bookmarkUserKey: [],
        isbn10: "",
        isbn13: "",
        isAdult: false,
        categoryName: "",
        categoryList: [],
        title: "",
        contents: "",
        url: "",
        isbn: "",
        datetime: DateTime.now(),
        createdAt: DateTime.now(),
        lastReviewCreatedAt: DateTime.now(),
        authors: [],
        publisher: "",
        translators: [],
        price: 0,
        thumbnail: "",
        reviewUser: [],
      );
}
