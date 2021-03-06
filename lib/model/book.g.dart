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
      starUserKey: (json['starUserKey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      starRating: (json['starRating'] as num?)?.toDouble(),
      favoriteUserKey: (json['favoriteUserKey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      favoriteRating: (json['favoriteRating'] as num?)?.toDouble(),
      bookmarkUserKey: (json['bookmarkUserKey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isbn10: json['isbn10'] as String?,
      isbn13: json['isbn13'] as String?,
      isAdult: json['isAdult'] as bool?,
      categoryName: json['categoryName'] as String?,
      categoryList: (json['categoryList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      lastReviewCreatedAt: json['lastReviewCreatedAt'] == null
          ? null
          : DateTime.parse(json['lastReviewCreatedAt'] as String),
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      publisher: json['publisher'] as String,
      translators: (json['translators'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as int,
      thumbnail: json['thumbnail'] as String,
      reviewUser: (json['reviewUser'] as List<dynamic>?)
          ?.map((e) => ReviewUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'docKey': instance.docKey,
      'searchKeyWord': instance.searchKeyWord,
      'starUserKey': instance.starUserKey,
      'starRating': instance.starRating,
      'favoriteUserKey': instance.favoriteUserKey,
      'favoriteRating': instance.favoriteRating,
      'bookmarkUserKey': instance.bookmarkUserKey,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'isAdult': instance.isAdult,
      'categoryName': instance.categoryName,
      'categoryList': instance.categoryList,
      'title': instance.title,
      'contents': instance.contents,
      'url': instance.url,
      'isbn': instance.isbn,
      'datetime': instance.datetime?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastReviewCreatedAt': instance.lastReviewCreatedAt?.toIso8601String(),
      'authors': instance.authors,
      'publisher': instance.publisher,
      'translators': instance.translators,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
      'reviewUser': instance.reviewUser,
    };
