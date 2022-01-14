import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/service/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userKey,
    required String nickName,
    required String imageUrl,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _User;
  const UserProfile._();
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.empty() => UserProfile(
        userKey: "",
        nickName: "",
        imageUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
