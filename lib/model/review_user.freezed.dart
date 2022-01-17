// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) {
  return _ReviewUser.fromJson(json);
}

/// @nodoc
class _$ReviewUserTearOff {
  const _$ReviewUserTearOff();

  _ReviewUser call({required Review review, required UserProfile userProfile}) {
    return _ReviewUser(
      review: review,
      userProfile: userProfile,
    );
  }

  ReviewUser fromJson(Map<String, Object?> json) {
    return ReviewUser.fromJson(json);
  }
}

/// @nodoc
const $ReviewUser = _$ReviewUserTearOff();

/// @nodoc
mixin _$ReviewUser {
  Review get review => throw _privateConstructorUsedError;
  UserProfile get userProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewUserCopyWith<ReviewUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUserCopyWith<$Res> {
  factory $ReviewUserCopyWith(
          ReviewUser value, $Res Function(ReviewUser) then) =
      _$ReviewUserCopyWithImpl<$Res>;
  $Res call({Review review, UserProfile userProfile});

  $ReviewCopyWith<$Res> get review;
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$ReviewUserCopyWithImpl<$Res> implements $ReviewUserCopyWith<$Res> {
  _$ReviewUserCopyWithImpl(this._value, this._then);

  final ReviewUser _value;
  // ignore: unused_field
  final $Res Function(ReviewUser) _then;

  @override
  $Res call({
    Object? review = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_value.copyWith(
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }

  @override
  $ReviewCopyWith<$Res> get review {
    return $ReviewCopyWith<$Res>(_value.review, (value) {
      return _then(_value.copyWith(review: value));
    });
  }

  @override
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
abstract class _$ReviewUserCopyWith<$Res> implements $ReviewUserCopyWith<$Res> {
  factory _$ReviewUserCopyWith(
          _ReviewUser value, $Res Function(_ReviewUser) then) =
      __$ReviewUserCopyWithImpl<$Res>;
  @override
  $Res call({Review review, UserProfile userProfile});

  @override
  $ReviewCopyWith<$Res> get review;
  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$ReviewUserCopyWithImpl<$Res> extends _$ReviewUserCopyWithImpl<$Res>
    implements _$ReviewUserCopyWith<$Res> {
  __$ReviewUserCopyWithImpl(
      _ReviewUser _value, $Res Function(_ReviewUser) _then)
      : super(_value, (v) => _then(v as _ReviewUser));

  @override
  _ReviewUser get _value => super._value as _ReviewUser;

  @override
  $Res call({
    Object? review = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_ReviewUser(
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewUser implements _ReviewUser {
  const _$_ReviewUser({required this.review, required this.userProfile});

  factory _$_ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewUserFromJson(json);

  @override
  final Review review;
  @override
  final UserProfile userProfile;

  @override
  String toString() {
    return 'ReviewUser(review: $review, userProfile: $userProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewUser &&
            const DeepCollectionEquality().equals(other.review, review) &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(review),
      const DeepCollectionEquality().hash(userProfile));

  @JsonKey(ignore: true)
  @override
  _$ReviewUserCopyWith<_ReviewUser> get copyWith =>
      __$ReviewUserCopyWithImpl<_ReviewUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewUserToJson(this);
  }
}

abstract class _ReviewUser implements ReviewUser {
  const factory _ReviewUser(
      {required Review review,
      required UserProfile userProfile}) = _$_ReviewUser;

  factory _ReviewUser.fromJson(Map<String, dynamic> json) =
      _$_ReviewUser.fromJson;

  @override
  Review get review;
  @override
  UserProfile get userProfile;
  @override
  @JsonKey(ignore: true)
  _$ReviewUserCopyWith<_ReviewUser> get copyWith =>
      throw _privateConstructorUsedError;
}
