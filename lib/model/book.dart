import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/service/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String? docKey,
    required List<String>? searchKeyWord,
    required String title,
    required String contents,
    required String url,
    required String isbn,
    required DateTime? datetime,
    // @TimestampConverter() required DateTime? dateTime,
    required List<String> authors,
    required String publisher,
    required List<String> translators,
    required int price,
    required String thumbnail,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
