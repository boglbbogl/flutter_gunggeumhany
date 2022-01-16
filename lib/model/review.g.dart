// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      docKey: json['docKey'] as String,
      bookDocKey: json['bookDocKey'] as String,
      userKey: json['userKey'] as String,
      starRating: (json['starRating'] as num).toDouble(),
      favoriteRating: (json['favoriteRating'] as num).toDouble(),
      contents: json['contents'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'docKey': instance.docKey,
      'bookDocKey': instance.bookDocKey,
      'userKey': instance.userKey,
      'starRating': instance.starRating,
      'favoriteRating': instance.favoriteRating,
      'contents': instance.contents,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
