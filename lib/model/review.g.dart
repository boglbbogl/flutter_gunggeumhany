// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      docKey: json['docKey'] as String,
      bookDocKey: json['bookDocKey'] as String,
      userKey: json['userKey'] as String,
      isBlocked: json['isBlocked'] as bool,
      starRating: (json['starRating'] as num).toDouble(),
      favoriteRating: (json['favoriteRating'] as num).toDouble(),
      contents: json['contents'] as String,
      bookTitle: json['bookTitle'] as String,
      bookAuthors: (json['bookAuthors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'docKey': instance.docKey,
      'bookDocKey': instance.bookDocKey,
      'userKey': instance.userKey,
      'isBlocked': instance.isBlocked,
      'starRating': instance.starRating,
      'favoriteRating': instance.favoriteRating,
      'contents': instance.contents,
      'bookTitle': instance.bookTitle,
      'bookAuthors': instance.bookAuthors,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

_$_ReviewBlocked _$$_ReviewBlockedFromJson(Map<String, dynamic> json) =>
    _$_ReviewBlocked(
      classification: json['classification'] as String,
      userKey: json['userKey'] as String,
      docKey: json['docKey'] as String,
      isChecked: json['isChecked'] as bool,
      blockedUserKey: json['blockedUserKey'] as String,
      bookDocKey: json['bookDocKey'] as String,
      reviewDocKey: json['reviewDocKey'] as String,
      category: json['category'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ReviewBlockedToJson(_$_ReviewBlocked instance) =>
    <String, dynamic>{
      'classification': instance.classification,
      'userKey': instance.userKey,
      'docKey': instance.docKey,
      'isChecked': instance.isChecked,
      'blockedUserKey': instance.blockedUserKey,
      'bookDocKey': instance.bookDocKey,
      'reviewDocKey': instance.reviewDocKey,
      'category': instance.category,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
