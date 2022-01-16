import 'package:flutter_gunggeumhany/service/core/timestamp_converter.dart';
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
    required double? favoirteRating,
    required String title,
    required String contents,
    required String url,
    required String isbn,
    required DateTime? datetime,
    @TimestampConverter() required DateTime? createdAt,
    required List<String> authors,
    required String publisher,
    required List<String> translators,
    required int price,
    required String thumbnail,
  }) = _Book;
  const Book._();
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  factory Book.empty() => Book(
        docKey: "",
        searchKeyWord: [],
        starUserKey: [],
        starRating: 0.0,
        favoriteUserKey: [],
        favoirteRating: 0.0,
        title: "",
        contents: "",
        url: "",
        isbn: "",
        datetime: DateTime.now(),
        createdAt: DateTime.now(),
        authors: [],
        publisher: "",
        translators: [],
        price: 0,
        thumbnail: "",
      );
}
