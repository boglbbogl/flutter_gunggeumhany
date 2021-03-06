import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userKey,
    required String nickName,
    required String email,
    required String profileImageUrl,
    required String presentProfileImageUrl,
    required String socialProfileImageUrl,
    required String provider,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _UserProfile;
  const UserProfile._();
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.empty() => UserProfile(
        userKey: "",
        nickName: "",
        email: "",
        presentProfileImageUrl: "",
        profileImageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutter-gunggeumhany-eef52.appspot.com/o/contant%2Fuser.png?alt=media&token=33cc9343-e3e4-4f56-99d3-26eda3477173",
        socialProfileImageUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        provider: "",
      );
}
