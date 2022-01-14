// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      docKey: json['docKey'] as String?,
      searchKeyWord: (json['searchKeyWord'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviewUserKey: (json['reviewUserKey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviewRating: json['reviewRating'] as int?,
      title: json['title'] as String,
      contents: json['contents'] as String,
      url: json['url'] as String,
      isbn: json['isbn'] as String,
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      publisher: json['publisher'] as String,
      translators: (json['translators'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as int,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'docKey': instance.docKey,
      'searchKeyWord': instance.searchKeyWord,
      'reviewUserKey': instance.reviewUserKey,
      'reviewRating': instance.reviewRating,
      'title': instance.title,
      'contents': instance.contents,
      'url': instance.url,
      'isbn': instance.isbn,
      'datetime': instance.datetime?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'authors': instance.authors,
      'publisher': instance.publisher,
      'translators': instance.translators,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
    };