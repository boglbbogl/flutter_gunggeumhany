// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return _UserInformation.fromJson(json);
}

/// @nodoc
class _$UserInformationTearOff {
  const _$UserInformationTearOff();

  _UserInformation call(
      {required String userKey,
      required String age,
      required String sex,
      required PreferenceModel preference}) {
    return _UserInformation(
      userKey: userKey,
      age: age,
      sex: sex,
      preference: preference,
    );
  }

  UserInformation fromJson(Map<String, Object?> json) {
    return UserInformation.fromJson(json);
  }
}

/// @nodoc
const $UserInformation = _$UserInformationTearOff();

/// @nodoc
mixin _$UserInformation {
  String get userKey => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  PreferenceModel get preference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationCopyWith<UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) then) =
      _$UserInformationCopyWithImpl<$Res>;
  $Res call(
      {String userKey, String age, String sex, PreferenceModel preference});

  $PreferenceModelCopyWith<$Res> get preference;
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._value, this._then);

  final UserInformation _value;
  // ignore: unused_field
  final $Res Function(UserInformation) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? preference = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      preference: preference == freezed
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as PreferenceModel,
    ));
  }

  @override
  $PreferenceModelCopyWith<$Res> get preference {
    return $PreferenceModelCopyWith<$Res>(_value.preference, (value) {
      return _then(_value.copyWith(preference: value));
    });
  }
}

/// @nodoc
abstract class _$UserInformationCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$UserInformationCopyWith(
          _UserInformation value, $Res Function(_UserInformation) then) =
      __$UserInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey, String age, String sex, PreferenceModel preference});

  @override
  $PreferenceModelCopyWith<$Res> get preference;
}

/// @nodoc
class __$UserInformationCopyWithImpl<$Res>
    extends _$UserInformationCopyWithImpl<$Res>
    implements _$UserInformationCopyWith<$Res> {
  __$UserInformationCopyWithImpl(
      _UserInformation _value, $Res Function(_UserInformation) _then)
      : super(_value, (v) => _then(v as _UserInformation));

  @override
  _UserInformation get _value => super._value as _UserInformation;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? preference = freezed,
  }) {
    return _then(_UserInformation(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      preference: preference == freezed
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as PreferenceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInformation extends _UserInformation {
  const _$_UserInformation(
      {required this.userKey,
      required this.age,
      required this.sex,
      required this.preference})
      : super._();

  factory _$_UserInformation.fromJson(Map<String, dynamic> json) =>
      _$$_UserInformationFromJson(json);

  @override
  final String userKey;
  @override
  final String age;
  @override
  final String sex;
  @override
  final PreferenceModel preference;

  @override
  String toString() {
    return 'UserInformation(userKey: $userKey, age: $age, sex: $sex, preference: $preference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInformation &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality()
                .equals(other.preference, preference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(sex),
      const DeepCollectionEquality().hash(preference));

  @JsonKey(ignore: true)
  @override
  _$UserInformationCopyWith<_UserInformation> get copyWith =>
      __$UserInformationCopyWithImpl<_UserInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInformationToJson(this);
  }
}

abstract class _UserInformation extends UserInformation {
  const factory _UserInformation(
      {required String userKey,
      required String age,
      required String sex,
      required PreferenceModel preference}) = _$_UserInformation;
  const _UserInformation._() : super._();

  factory _UserInformation.fromJson(Map<String, dynamic> json) =
      _$_UserInformation.fromJson;

  @override
  String get userKey;
  @override
  String get age;
  @override
  String get sex;
  @override
  PreferenceModel get preference;
  @override
  @JsonKey(ignore: true)
  _$UserInformationCopyWith<_UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
