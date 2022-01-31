// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      userKey: json['userKey'] as String,
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      presentProfileImageUrl: json['presentProfileImageUrl'] as String,
      socialProfileImageUrl: json['socialProfileImageUrl'] as String,
      provider: json['provider'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'nickName': instance.nickName,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'presentProfileImageUrl': instance.presentProfileImageUrl,
      'socialProfileImageUrl': instance.socialProfileImageUrl,
      'provider': instance.provider,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
