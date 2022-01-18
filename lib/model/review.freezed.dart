// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
class _$ReviewTearOff {
  const _$ReviewTearOff();

  _Review call(
      {required String docKey,
      required String bookDocKey,
      required String userKey,
      required double starRating,
      required double favoriteRating,
      required String contents,
      required String bookTitle,
      required List<String> bookAuthors,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) {
    return _Review(
      docKey: docKey,
      bookDocKey: bookDocKey,
      userKey: userKey,
      starRating: starRating,
      favoriteRating: favoriteRating,
      contents: contents,
      bookTitle: bookTitle,
      bookAuthors: bookAuthors,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Review fromJson(Map<String, Object?> json) {
    return Review.fromJson(json);
  }
}

/// @nodoc
const $Review = _$ReviewTearOff();

/// @nodoc
mixin _$Review {
  String get docKey => throw _privateConstructorUsedError;
  String get bookDocKey => throw _privateConstructorUsedError;
  String get userKey => throw _privateConstructorUsedError;
  double get starRating => throw _privateConstructorUsedError;
  double get favoriteRating => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get bookTitle => throw _privateConstructorUsedError;
  List<String> get bookAuthors => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call(
      {String docKey,
      String bookDocKey,
      String userKey,
      double starRating,
      double favoriteRating,
      String contents,
      String bookTitle,
      List<String> bookAuthors,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? docKey = freezed,
    Object? bookDocKey = freezed,
    Object? userKey = freezed,
    Object? starRating = freezed,
    Object? favoriteRating = freezed,
    Object? contents = freezed,
    Object? bookTitle = freezed,
    Object? bookAuthors = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookDocKey: bookDocKey == freezed
          ? _value.bookDocKey
          : bookDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteRating: favoriteRating == freezed
          ? _value.favoriteRating
          : favoriteRating // ignore: cast_nullable_to_non_nullable
              as double,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      bookTitle: bookTitle == freezed
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bookAuthors: bookAuthors == freezed
          ? _value.bookAuthors
          : bookAuthors // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) then) =
      __$ReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String docKey,
      String bookDocKey,
      String userKey,
      double starRating,
      double favoriteRating,
      String contents,
      String bookTitle,
      List<String> bookAuthors,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(_Review _value, $Res Function(_Review) _then)
      : super(_value, (v) => _then(v as _Review));

  @override
  _Review get _value => super._value as _Review;

  @override
  $Res call({
    Object? docKey = freezed,
    Object? bookDocKey = freezed,
    Object? userKey = freezed,
    Object? starRating = freezed,
    Object? favoriteRating = freezed,
    Object? contents = freezed,
    Object? bookTitle = freezed,
    Object? bookAuthors = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Review(
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookDocKey: bookDocKey == freezed
          ? _value.bookDocKey
          : bookDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteRating: favoriteRating == freezed
          ? _value.favoriteRating
          : favoriteRating // ignore: cast_nullable_to_non_nullable
              as double,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      bookTitle: bookTitle == freezed
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bookAuthors: bookAuthors == freezed
          ? _value.bookAuthors
          : bookAuthors // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$_Review extends _Review {
  const _$_Review(
      {required this.docKey,
      required this.bookDocKey,
      required this.userKey,
      required this.starRating,
      required this.favoriteRating,
      required this.contents,
      required this.bookTitle,
      required this.bookAuthors,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final String docKey;
  @override
  final String bookDocKey;
  @override
  final String userKey;
  @override
  final double starRating;
  @override
  final double favoriteRating;
  @override
  final String contents;
  @override
  final String bookTitle;
  @override
  final List<String> bookAuthors;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Review(docKey: $docKey, bookDocKey: $bookDocKey, userKey: $userKey, starRating: $starRating, favoriteRating: $favoriteRating, contents: $contents, bookTitle: $bookTitle, bookAuthors: $bookAuthors, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality()
                .equals(other.bookDocKey, bookDocKey) &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality()
                .equals(other.starRating, starRating) &&
            const DeepCollectionEquality()
                .equals(other.favoriteRating, favoriteRating) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality().equals(other.bookTitle, bookTitle) &&
            const DeepCollectionEquality()
                .equals(other.bookAuthors, bookAuthors) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(bookDocKey),
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(starRating),
      const DeepCollectionEquality().hash(favoriteRating),
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(bookTitle),
      const DeepCollectionEquality().hash(bookAuthors),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review extends Review {
  const factory _Review(
      {required String docKey,
      required String bookDocKey,
      required String userKey,
      required double starRating,
      required double favoriteRating,
      required String contents,
      required String bookTitle,
      required List<String> bookAuthors,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _$_Review;
  const _Review._() : super._();

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String get docKey;
  @override
  String get bookDocKey;
  @override
  String get userKey;
  @override
  double get starRating;
  @override
  double get favoriteRating;
  @override
  String get contents;
  @override
  String get bookTitle;
  @override
  List<String> get bookAuthors;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$ReviewCopyWith<_Review> get copyWith => throw _privateConstructorUsedError;
}
