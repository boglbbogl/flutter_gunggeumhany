// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserActivity _$$_UserActivityFromJson(Map<String, dynamic> json) =>
    _$_UserActivity(
      userKey: json['userKey'] as String,
      bookmarkBookDocKey: (json['bookmarkBookDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      myReviewDocKey: (json['myReviewDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UserActivityToJson(_$_UserActivity instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'bookmarkBookDocKey': instance.bookmarkBookDocKey,
      'myReviewDocKey': instance.myReviewDocKey,
    };
