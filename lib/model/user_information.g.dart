// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInformation _$$_UserInformationFromJson(Map<String, dynamic> json) =>
    _$_UserInformation(
      userKey: json['userKey'] as String,
      age: json['age'] as String,
      sex: json['sex'] as int,
      preference: (json['preference'] as List<dynamic>)
          .map((e) => PreferenceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserInformationToJson(_$_UserInformation instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'age': instance.age,
      'sex': instance.sex,
      'preference': instance.preference,
    };
