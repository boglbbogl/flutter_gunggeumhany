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
      required bool isBlocked,
      required double starRating,
      required double favoriteRating,
      required String contents,
      required String bookTitle,
      required List<String> bookAuthors,
      @TimestampConverter() required DateTime createdAt}) {
    return _Review(
      docKey: docKey,
      bookDocKey: bookDocKey,
      userKey: userKey,
      isBlocked: isBlocked,
      starRating: starRating,
      favoriteRating: favoriteRating,
      contents: contents,
      bookTitle: bookTitle,
      bookAuthors: bookAuthors,
      createdAt: createdAt,
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
  bool get isBlocked => throw _privateConstructorUsedError;
  double get starRating => throw _privateConstructorUsedError;
  double get favoriteRating => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get bookTitle => throw _privateConstructorUsedError;
  List<String> get bookAuthors => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

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
      bool isBlocked,
      double starRating,
      double favoriteRating,
      String contents,
      String bookTitle,
      List<String> bookAuthors,
      @TimestampConverter() DateTime createdAt});
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
    Object? isBlocked = freezed,
    Object? starRating = freezed,
    Object? favoriteRating = freezed,
    Object? contents = freezed,
    Object? bookTitle = freezed,
    Object? bookAuthors = freezed,
    Object? createdAt = freezed,
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
      isBlocked: isBlocked == freezed
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
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
      bool isBlocked,
      double starRating,
      double favoriteRating,
      String contents,
      String bookTitle,
      List<String> bookAuthors,
      @TimestampConverter() DateTime createdAt});
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
    Object? isBlocked = freezed,
    Object? starRating = freezed,
    Object? favoriteRating = freezed,
    Object? contents = freezed,
    Object? bookTitle = freezed,
    Object? bookAuthors = freezed,
    Object? createdAt = freezed,
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
      isBlocked: isBlocked == freezed
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.isBlocked,
      required this.starRating,
      required this.favoriteRating,
      required this.contents,
      required this.bookTitle,
      required this.bookAuthors,
      @TimestampConverter() required this.createdAt})
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
  final bool isBlocked;
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
  String toString() {
    return 'Review(docKey: $docKey, bookDocKey: $bookDocKey, userKey: $userKey, isBlocked: $isBlocked, starRating: $starRating, favoriteRating: $favoriteRating, contents: $contents, bookTitle: $bookTitle, bookAuthors: $bookAuthors, createdAt: $createdAt)';
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
            const DeepCollectionEquality().equals(other.isBlocked, isBlocked) &&
            const DeepCollectionEquality()
                .equals(other.starRating, starRating) &&
            const DeepCollectionEquality()
                .equals(other.favoriteRating, favoriteRating) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality().equals(other.bookTitle, bookTitle) &&
            const DeepCollectionEquality()
                .equals(other.bookAuthors, bookAuthors) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(bookDocKey),
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(isBlocked),
      const DeepCollectionEquality().hash(starRating),
      const DeepCollectionEquality().hash(favoriteRating),
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(bookTitle),
      const DeepCollectionEquality().hash(bookAuthors),
      const DeepCollectionEquality().hash(createdAt));

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
      required bool isBlocked,
      required double starRating,
      required double favoriteRating,
      required String contents,
      required String bookTitle,
      required List<String> bookAuthors,
      @TimestampConverter() required DateTime createdAt}) = _$_Review;
  const _Review._() : super._();

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String get docKey;
  @override
  String get bookDocKey;
  @override
  String get userKey;
  @override
  bool get isBlocked;
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
  @JsonKey(ignore: true)
  _$ReviewCopyWith<_Review> get copyWith => throw _privateConstructorUsedError;
}

ReviewBlocked _$ReviewBlockedFromJson(Map<String, dynamic> json) {
  return _ReviewBlocked.fromJson(json);
}

/// @nodoc
class _$ReviewBlockedTearOff {
  const _$ReviewBlockedTearOff();

  _ReviewBlocked call(
      {required String classification,
      required String userKey,
      required String docKey,
      required bool isChecked,
      required String blockedUserKey,
      required String bookDocKey,
      required String reviewDocKey,
      required String category,
      @TimestampConverter() required DateTime createdAt}) {
    return _ReviewBlocked(
      classification: classification,
      userKey: userKey,
      docKey: docKey,
      isChecked: isChecked,
      blockedUserKey: blockedUserKey,
      bookDocKey: bookDocKey,
      reviewDocKey: reviewDocKey,
      category: category,
      createdAt: createdAt,
    );
  }

  ReviewBlocked fromJson(Map<String, Object?> json) {
    return ReviewBlocked.fromJson(json);
  }
}

/// @nodoc
const $ReviewBlocked = _$ReviewBlockedTearOff();

/// @nodoc
mixin _$ReviewBlocked {
  String get classification => throw _privateConstructorUsedError;
  String get userKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  String get blockedUserKey => throw _privateConstructorUsedError;
  String get bookDocKey => throw _privateConstructorUsedError;
  String get reviewDocKey => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewBlockedCopyWith<ReviewBlocked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewBlockedCopyWith<$Res> {
  factory $ReviewBlockedCopyWith(
          ReviewBlocked value, $Res Function(ReviewBlocked) then) =
      _$ReviewBlockedCopyWithImpl<$Res>;
  $Res call(
      {String classification,
      String userKey,
      String docKey,
      bool isChecked,
      String blockedUserKey,
      String bookDocKey,
      String reviewDocKey,
      String category,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ReviewBlockedCopyWithImpl<$Res>
    implements $ReviewBlockedCopyWith<$Res> {
  _$ReviewBlockedCopyWithImpl(this._value, this._then);

  final ReviewBlocked _value;
  // ignore: unused_field
  final $Res Function(ReviewBlocked) _then;

  @override
  $Res call({
    Object? classification = freezed,
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? isChecked = freezed,
    Object? blockedUserKey = freezed,
    Object? bookDocKey = freezed,
    Object? reviewDocKey = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      classification: classification == freezed
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserKey: blockedUserKey == freezed
          ? _value.blockedUserKey
          : blockedUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookDocKey: bookDocKey == freezed
          ? _value.bookDocKey
          : bookDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDocKey: reviewDocKey == freezed
          ? _value.reviewDocKey
          : reviewDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ReviewBlockedCopyWith<$Res>
    implements $ReviewBlockedCopyWith<$Res> {
  factory _$ReviewBlockedCopyWith(
          _ReviewBlocked value, $Res Function(_ReviewBlocked) then) =
      __$ReviewBlockedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String classification,
      String userKey,
      String docKey,
      bool isChecked,
      String blockedUserKey,
      String bookDocKey,
      String reviewDocKey,
      String category,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ReviewBlockedCopyWithImpl<$Res>
    extends _$ReviewBlockedCopyWithImpl<$Res>
    implements _$ReviewBlockedCopyWith<$Res> {
  __$ReviewBlockedCopyWithImpl(
      _ReviewBlocked _value, $Res Function(_ReviewBlocked) _then)
      : super(_value, (v) => _then(v as _ReviewBlocked));

  @override
  _ReviewBlocked get _value => super._value as _ReviewBlocked;

  @override
  $Res call({
    Object? classification = freezed,
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? isChecked = freezed,
    Object? blockedUserKey = freezed,
    Object? bookDocKey = freezed,
    Object? reviewDocKey = freezed,
    Object? category = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ReviewBlocked(
      classification: classification == freezed
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserKey: blockedUserKey == freezed
          ? _value.blockedUserKey
          : blockedUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      bookDocKey: bookDocKey == freezed
          ? _value.bookDocKey
          : bookDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDocKey: reviewDocKey == freezed
          ? _value.reviewDocKey
          : reviewDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewBlocked extends _ReviewBlocked {
  const _$_ReviewBlocked(
      {required this.classification,
      required this.userKey,
      required this.docKey,
      required this.isChecked,
      required this.blockedUserKey,
      required this.bookDocKey,
      required this.reviewDocKey,
      required this.category,
      @TimestampConverter() required this.createdAt})
      : super._();

  factory _$_ReviewBlocked.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewBlockedFromJson(json);

  @override
  final String classification;
  @override
  final String userKey;
  @override
  final String docKey;
  @override
  final bool isChecked;
  @override
  final String blockedUserKey;
  @override
  final String bookDocKey;
  @override
  final String reviewDocKey;
  @override
  final String category;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReviewBlocked(classification: $classification, userKey: $userKey, docKey: $docKey, isChecked: $isChecked, blockedUserKey: $blockedUserKey, bookDocKey: $bookDocKey, reviewDocKey: $reviewDocKey, category: $category, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewBlocked &&
            const DeepCollectionEquality()
                .equals(other.classification, classification) &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.isChecked, isChecked) &&
            const DeepCollectionEquality()
                .equals(other.blockedUserKey, blockedUserKey) &&
            const DeepCollectionEquality()
                .equals(other.bookDocKey, bookDocKey) &&
            const DeepCollectionEquality()
                .equals(other.reviewDocKey, reviewDocKey) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(classification),
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(isChecked),
      const DeepCollectionEquality().hash(blockedUserKey),
      const DeepCollectionEquality().hash(bookDocKey),
      const DeepCollectionEquality().hash(reviewDocKey),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ReviewBlockedCopyWith<_ReviewBlocked> get copyWith =>
      __$ReviewBlockedCopyWithImpl<_ReviewBlocked>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewBlockedToJson(this);
  }
}

abstract class _ReviewBlocked extends ReviewBlocked {
  const factory _ReviewBlocked(
      {required String classification,
      required String userKey,
      required String docKey,
      required bool isChecked,
      required String blockedUserKey,
      required String bookDocKey,
      required String reviewDocKey,
      required String category,
      @TimestampConverter() required DateTime createdAt}) = _$_ReviewBlocked;
  const _ReviewBlocked._() : super._();

  factory _ReviewBlocked.fromJson(Map<String, dynamic> json) =
      _$_ReviewBlocked.fromJson;

  @override
  String get classification;
  @override
  String get userKey;
  @override
  String get docKey;
  @override
  bool get isChecked;
  @override
  String get blockedUserKey;
  @override
  String get bookDocKey;
  @override
  String get reviewDocKey;
  @override
  String get category;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ReviewBlockedCopyWith<_ReviewBlocked> get copyWith =>
      throw _privateConstructorUsedError;
}
