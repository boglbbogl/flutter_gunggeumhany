// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PreferenceModel _$$_PreferenceModelFromJson(Map<String, dynamic> json) =>
    _$_PreferenceModel(
      isbn13: json['isbn13'] as String,
      isbn10: json['isbn10'] as String,
      title: json['title'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      starRating: (json['starRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PreferenceModelToJson(_$_PreferenceModel instance) =>
    <String, dynamic>{
      'isbn13': instance.isbn13,
      'isbn10': instance.isbn10,
      'title': instance.title,
      'category': instance.category,
      'starRating': instance.starRating,
    };
