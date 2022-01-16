import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kakao_book.freezed.dart';
part 'kakao_book.g.dart';

@freezed
class KakaoBook with _$KakaoBook {
  const factory KakaoBook({
    required KakaoBookMeta meta,
    required List<Book> documents,
  }) = _KakaoBook;
  factory KakaoBook.fromJson(Map<String, dynamic> json) =>
      _$KakaoBookFromJson(json);
}

// @freezed
// class KakaoBookDoc with _$KakaoBookDoc {
//   const factory KakaoBookDoc({
//     required String? docKey,
//     required String title,
//     required String contents,
//     required String url,
//     required String isbn,
//     @JsonKey(name: "datetime") required DateTime dateTime,
//     required List<String> authors,
//     required String publisher,
//     required List<String> translators,
//     required int price,
//     required String thumbnail,
//   }) = _KakaoBookDoc;
//   factory KakaoBookDoc.fromJson(Map<String, dynamic> json) =>
//       _$KakaoBookDocFromJson(json);
// }

@freezed
class KakaoBookMeta with _$KakaoBookMeta {
  const factory KakaoBookMeta({
    @JsonKey(name: "is_end") required bool isEnd,
    @JsonKey(name: "pageable_count") required int pageableCount,
    @JsonKey(name: "total_count") required int totalCount,
  }) = _KakaoBookMeta;
  factory KakaoBookMeta.fromJson(Map<String, dynamic> json) =>
      _$KakaoBookMetaFromJson(json);
}
