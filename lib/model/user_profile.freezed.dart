// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _User call(
      {required String userKey,
      required String nickName,
      required String profileImageUrl,
      required String presentProfileImageUrl,
      required String socialProfileImageUrl,
      required String provider,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) {
    return _User(
      userKey: userKey,
      nickName: nickName,
      profileImageUrl: profileImageUrl,
      presentProfileImageUrl: presentProfileImageUrl,
      socialProfileImageUrl: socialProfileImageUrl,
      provider: provider,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  UserProfile fromJson(Map<String, Object?> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  String get userKey => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get presentProfileImageUrl => throw _privateConstructorUsedError;
  String get socialProfileImageUrl => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String nickName,
      String profileImageUrl,
      String presentProfileImageUrl,
      String socialProfileImageUrl,
      String provider,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? nickName = freezed,
    Object? profileImageUrl = freezed,
    Object? presentProfileImageUrl = freezed,
    Object? socialProfileImageUrl = freezed,
    Object? provider = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      presentProfileImageUrl: presentProfileImageUrl == freezed
          ? _value.presentProfileImageUrl
          : presentProfileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      socialProfileImageUrl: socialProfileImageUrl == freezed
          ? _value.socialProfileImageUrl
          : socialProfileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String nickName,
      String profileImageUrl,
      String presentProfileImageUrl,
      String socialProfileImageUrl,
      String provider,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? nickName = freezed,
    Object? profileImageUrl = freezed,
    Object? presentProfileImageUrl = freezed,
    Object? socialProfileImageUrl = freezed,
    Object? provider = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_User(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      presentProfileImageUrl: presentProfileImageUrl == freezed
          ? _value.presentProfileImageUrl
          : presentProfileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      socialProfileImageUrl: socialProfileImageUrl == freezed
          ? _value.socialProfileImageUrl
          : socialProfileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {required this.userKey,
      required this.nickName,
      required this.profileImageUrl,
      required this.presentProfileImageUrl,
      required this.socialProfileImageUrl,
      required this.provider,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String userKey;
  @override
  final String nickName;
  @override
  final String profileImageUrl;
  @override
  final String presentProfileImageUrl;
  @override
  final String socialProfileImageUrl;
  @override
  final String provider;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProfile(userKey: $userKey, nickName: $nickName, profileImageUrl: $profileImageUrl, presentProfileImageUrl: $presentProfileImageUrl, socialProfileImageUrl: $socialProfileImageUrl, provider: $provider, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.nickName, nickName) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.presentProfileImageUrl, presentProfileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.socialProfileImageUrl, socialProfileImageUrl) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(nickName),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(presentProfileImageUrl),
      const DeepCollectionEquality().hash(socialProfileImageUrl),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends UserProfile {
  const factory _User(
      {required String userKey,
      required String nickName,
      required String profileImageUrl,
      required String presentProfileImageUrl,
      required String socialProfileImageUrl,
      required String provider,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get userKey;
  @override
  String get nickName;
  @override
  String get profileImageUrl;
  @override
  String get presentProfileImageUrl;
  @override
  String get socialProfileImageUrl;
  @override
  String get provider;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
