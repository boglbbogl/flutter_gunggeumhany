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
      reviewInStarDocKey: (json['reviewInStarDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reviewInStarRating: (json['reviewInStarRating'] as num).toDouble(),
      reviewInFavoriteDocKey: (json['reviewInFavoriteDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reviewInFavoriteRating:
          (json['reviewInFavoriteRating'] as num).toDouble(),
      followerUserKey: (json['followerUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followingUserKey: (json['followingUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      blockedReviewDocKey: (json['blockedReviewDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      blockedUserUserKey: (json['blockedUserUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      improvementDocKey: (json['improvementDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      complainDocKey: (json['complainDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UserActivityToJson(_$_UserActivity instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'bookmarkBookDocKey': instance.bookmarkBookDocKey,
      'myReviewDocKey': instance.myReviewDocKey,
      'reviewInStarDocKey': instance.reviewInStarDocKey,
      'reviewInStarRating': instance.reviewInStarRating,
      'reviewInFavoriteDocKey': instance.reviewInFavoriteDocKey,
      'reviewInFavoriteRating': instance.reviewInFavoriteRating,
      'followerUserKey': instance.followerUserKey,
      'followingUserKey': instance.followingUserKey,
      'blockedReviewDocKey': instance.blockedReviewDocKey,
      'blockedUserUserKey': instance.blockedUserUserKey,
      'improvementDocKey': instance.improvementDocKey,
      'complainDocKey': instance.complainDocKey,
    };
