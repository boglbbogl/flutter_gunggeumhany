import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

@freezed
class UserInformation with _$UserInformation {
  const factory UserInformation({
    required String userKey,
    required String age,
    required String sex,
    required PreferenceModel preference,
  }) = _UserInformation;
  const UserInformation._();
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
  factory UserInformation.empty() => UserInformation(
        userKey: "",
        age: "",
        sex: "",
        preference: PreferenceModel.empty(),
      );
}
