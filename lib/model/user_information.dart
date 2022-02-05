import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

@freezed
class UserInformation with _$UserInformation {
  const factory UserInformation({
    required String userKey,
    required String age,
    required int sex,
    required List<PreferenceModel> preference,
  }) = _UserInformation;
  const UserInformation._();
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
  factory UserInformation.empty() => const UserInformation(
        userKey: "",
        age: "",
        sex: 0,
        preference: [],
      );
}
