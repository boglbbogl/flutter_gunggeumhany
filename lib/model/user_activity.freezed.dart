// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) {
  return _UserActivity.fromJson(json);
}

/// @nodoc
class _$UserActivityTearOff {
  const _$UserActivityTearOff();

  _UserActivity call(
      {required String userKey,
      required List<String> bookmarkBookDocKey,
      required List<String> myReviewDocKey}) {
    return _UserActivity(
      userKey: userKey,
      bookmarkBookDocKey: bookmarkBookDocKey,
      myReviewDocKey: myReviewDocKey,
    );
  }

  UserActivity fromJson(Map<String, Object?> json) {
    return UserActivity.fromJson(json);
  }
}

/// @nodoc
const $UserActivity = _$UserActivityTearOff();

/// @nodoc
mixin _$UserActivity {
  String get userKey => throw _privateConstructorUsedError;
  List<String> get bookmarkBookDocKey => throw _privateConstructorUsedError;
  List<String> get myReviewDocKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActivityCopyWith<UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityCopyWith<$Res> {
  factory $UserActivityCopyWith(
          UserActivity value, $Res Function(UserActivity) then) =
      _$UserActivityCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      List<String> bookmarkBookDocKey,
      List<String> myReviewDocKey});
}

/// @nodoc
class _$UserActivityCopyWithImpl<$Res> implements $UserActivityCopyWith<$Res> {
  _$UserActivityCopyWithImpl(this._value, this._then);

  final UserActivity _value;
  // ignore: unused_field
  final $Res Function(UserActivity) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? bookmarkBookDocKey = freezed,
    Object? myReviewDocKey = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkBookDocKey: bookmarkBookDocKey == freezed
          ? _value.bookmarkBookDocKey
          : bookmarkBookDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      myReviewDocKey: myReviewDocKey == freezed
          ? _value.myReviewDocKey
          : myReviewDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UserActivityCopyWith<$Res>
    implements $UserActivityCopyWith<$Res> {
  factory _$UserActivityCopyWith(
          _UserActivity value, $Res Function(_UserActivity) then) =
      __$UserActivityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      List<String> bookmarkBookDocKey,
      List<String> myReviewDocKey});
}

/// @nodoc
class __$UserActivityCopyWithImpl<$Res> extends _$UserActivityCopyWithImpl<$Res>
    implements _$UserActivityCopyWith<$Res> {
  __$UserActivityCopyWithImpl(
      _UserActivity _value, $Res Function(_UserActivity) _then)
      : super(_value, (v) => _then(v as _UserActivity));

  @override
  _UserActivity get _value => super._value as _UserActivity;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? bookmarkBookDocKey = freezed,
    Object? myReviewDocKey = freezed,
  }) {
    return _then(_UserActivity(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkBookDocKey: bookmarkBookDocKey == freezed
          ? _value.bookmarkBookDocKey
          : bookmarkBookDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      myReviewDocKey: myReviewDocKey == freezed
          ? _value.myReviewDocKey
          : myReviewDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserActivity extends _UserActivity {
  const _$_UserActivity(
      {required this.userKey,
      required this.bookmarkBookDocKey,
      required this.myReviewDocKey})
      : super._();

  factory _$_UserActivity.fromJson(Map<String, dynamic> json) =>
      _$$_UserActivityFromJson(json);

  @override
  final String userKey;
  @override
  final List<String> bookmarkBookDocKey;
  @override
  final List<String> myReviewDocKey;

  @override
  String toString() {
    return 'UserActivity(userKey: $userKey, bookmarkBookDocKey: $bookmarkBookDocKey, myReviewDocKey: $myReviewDocKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserActivity &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality()
                .equals(other.bookmarkBookDocKey, bookmarkBookDocKey) &&
            const DeepCollectionEquality()
                .equals(other.myReviewDocKey, myReviewDocKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(bookmarkBookDocKey),
      const DeepCollectionEquality().hash(myReviewDocKey));

  @JsonKey(ignore: true)
  @override
  _$UserActivityCopyWith<_UserActivity> get copyWith =>
      __$UserActivityCopyWithImpl<_UserActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserActivityToJson(this);
  }
}

abstract class _UserActivity extends UserActivity {
  const factory _UserActivity(
      {required String userKey,
      required List<String> bookmarkBookDocKey,
      required List<String> myReviewDocKey}) = _$_UserActivity;
  const _UserActivity._() : super._();

  factory _UserActivity.fromJson(Map<String, dynamic> json) =
      _$_UserActivity.fromJson;

  @override
  String get userKey;
  @override
  List<String> get bookmarkBookDocKey;
  @override
  List<String> get myReviewDocKey;
  @override
  @JsonKey(ignore: true)
  _$UserActivityCopyWith<_UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}
