// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewUser _$$_ReviewUserFromJson(Map<String, dynamic> json) =>
    _$_ReviewUser(
      review: Review.fromJson(json['review'] as Map<String, dynamic>),
      userProfile:
          UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReviewUserToJson(_$_ReviewUser instance) =>
    <String, dynamic>{
      'review': instance.review,
      'userProfile': instance.userProfile,
    };
