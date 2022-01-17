// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileModelTearOff {
  const _$ProfileModelTearOff();

  _ProfileModel call(
      {required UserProfile userProfile,
      required List<Review> review,
      required List<Book> book}) {
    return _ProfileModel(
      userProfile: userProfile,
      review: review,
      book: book,
    );
  }
}

/// @nodoc
const $ProfileModel = _$ProfileModelTearOff();

/// @nodoc
mixin _$ProfileModel {
  UserProfile get userProfile => throw _privateConstructorUsedError;
  List<Review> get review => throw _privateConstructorUsedError;
  List<Book> get book => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res>;
  $Res call({UserProfile userProfile, List<Review> review, List<Book> book});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  final ProfileModel _value;
  // ignore: unused_field
  final $Res Function(ProfileModel) _then;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? review = freezed,
    Object? book = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }

  @override
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) then) =
      __$ProfileModelCopyWithImpl<$Res>;
  @override
  $Res call({UserProfile userProfile, List<Review> review, List<Book> book});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res> extends _$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(
      _ProfileModel _value, $Res Function(_ProfileModel) _then)
      : super(_value, (v) => _then(v as _ProfileModel));

  @override
  _ProfileModel get _value => super._value as _ProfileModel;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? review = freezed,
    Object? book = freezed,
  }) {
    return _then(_ProfileModel(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$_ProfileModel implements _ProfileModel {
  const _$_ProfileModel(
      {required this.userProfile, required this.review, required this.book});

  @override
  final UserProfile userProfile;
  @override
  final List<Review> review;
  @override
  final List<Book> book;

  @override
  String toString() {
    return 'ProfileModel(userProfile: $userProfile, review: $review, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileModel &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile) &&
            const DeepCollectionEquality().equals(other.review, review) &&
            const DeepCollectionEquality().equals(other.book, book));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userProfile),
      const DeepCollectionEquality().hash(review),
      const DeepCollectionEquality().hash(book));

  @JsonKey(ignore: true)
  @override
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {required UserProfile userProfile,
      required List<Review> review,
      required List<Book> book}) = _$_ProfileModel;

  @override
  UserProfile get userProfile;
  @override
  List<Review> get review;
  @override
  List<Book> get book;
  @override
  @JsonKey(ignore: true)
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
