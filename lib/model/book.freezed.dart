// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {required String? docKey,
      required List<String>? searchKeyWord,
      required List<String>? starUserKey,
      required double? starRating,
      required List<String>? favoriteUserKey,
      required double? favoriteRating,
      required List<String>? bookmarkUserKey,
      required String? isbn10,
      required String? isbn13,
      required bool? isAudlt,
      required String title,
      required String contents,
      required String url,
      required String isbn,
      required DateTime? datetime,
      @TimestampConverter() required DateTime? createdAt,
      @TimestampConverter() required DateTime? lastReviewCreatedAt,
      required List<String> authors,
      required String publisher,
      required List<String> translators,
      required int price,
      required String thumbnail}) {
    return _Book(
      docKey: docKey,
      searchKeyWord: searchKeyWord,
      starUserKey: starUserKey,
      starRating: starRating,
      favoriteUserKey: favoriteUserKey,
      favoriteRating: favoriteRating,
      bookmarkUserKey: bookmarkUserKey,
      isbn10: isbn10,
      isbn13: isbn13,
      isAudlt: isAudlt,
      title: title,
      contents: contents,
      url: url,
      isbn: isbn,
      datetime: datetime,
      createdAt: createdAt,
      lastReviewCreatedAt: lastReviewCreatedAt,
      authors: authors,
      publisher: publisher,
      translators: translators,
      price: price,
      thumbnail: thumbnail,
    );
  }

  Book fromJson(Map<String, Object?> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  String? get docKey => throw _privateConstructorUsedError;
  List<String>? get searchKeyWord => throw _privateConstructorUsedError;
  List<String>? get starUserKey => throw _privateConstructorUsedError;
  double? get starRating => throw _privateConstructorUsedError;
  List<String>? get favoriteUserKey => throw _privateConstructorUsedError;
  double? get favoriteRating => throw _privateConstructorUsedError;
  List<String>? get bookmarkUserKey => throw _privateConstructorUsedError;
  String? get isbn10 => throw _privateConstructorUsedError;
  String? get isbn13 => throw _privateConstructorUsedError;
  bool? get isAudlt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  DateTime? get datetime => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get lastReviewCreatedAt => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  List<String> get translators => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String? docKey,
      List<String>? searchKeyWord,
      List<String>? starUserKey,
      double? starRating,
      List<String>? favoriteUserKey,
      double? favoriteRating,
      List<String>? bookmarkUserKey,
      String? isbn10,
      String? isbn13,
      bool? isAudlt,
      String title,
      String contents,
      String url,
      String isbn,
      DateTime? datetime,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? lastReviewCreatedAt,
      List<String> authors,
      String publisher,
      List<String> translators,
      int price,
      String thumbnail});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? docKey = freezed,
    Object? searchKeyWord = freezed,
    Object? starUserKey = freezed,
    Object? starRating = freezed,
    Object? favoriteUserKey = freezed,
    Object? favoriteRating = freezed,
    Object? bookmarkUserKey = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? isAudlt = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? url = freezed,
    Object? isbn = freezed,
    Object? datetime = freezed,
    Object? createdAt = freezed,
    Object? lastReviewCreatedAt = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? translators = freezed,
    Object? price = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String?,
      searchKeyWord: searchKeyWord == freezed
          ? _value.searchKeyWord
          : searchKeyWord // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starUserKey: starUserKey == freezed
          ? _value.starUserKey
          : starUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double?,
      favoriteUserKey: favoriteUserKey == freezed
          ? _value.favoriteUserKey
          : favoriteUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favoriteRating: favoriteRating == freezed
          ? _value.favoriteRating
          : favoriteRating // ignore: cast_nullable_to_non_nullable
              as double?,
      bookmarkUserKey: bookmarkUserKey == freezed
          ? _value.bookmarkUserKey
          : bookmarkUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isbn10: isbn10 == freezed
          ? _value.isbn10
          : isbn10 // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String?,
      isAudlt: isAudlt == freezed
          ? _value.isAudlt
          : isAudlt // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastReviewCreatedAt: lastReviewCreatedAt == freezed
          ? _value.lastReviewCreatedAt
          : lastReviewCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      translators: translators == freezed
          ? _value.translators
          : translators // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? docKey,
      List<String>? searchKeyWord,
      List<String>? starUserKey,
      double? starRating,
      List<String>? favoriteUserKey,
      double? favoriteRating,
      List<String>? bookmarkUserKey,
      String? isbn10,
      String? isbn13,
      bool? isAudlt,
      String title,
      String contents,
      String url,
      String isbn,
      DateTime? datetime,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? lastReviewCreatedAt,
      List<String> authors,
      String publisher,
      List<String> translators,
      int price,
      String thumbnail});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? docKey = freezed,
    Object? searchKeyWord = freezed,
    Object? starUserKey = freezed,
    Object? starRating = freezed,
    Object? favoriteUserKey = freezed,
    Object? favoriteRating = freezed,
    Object? bookmarkUserKey = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? isAudlt = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? url = freezed,
    Object? isbn = freezed,
    Object? datetime = freezed,
    Object? createdAt = freezed,
    Object? lastReviewCreatedAt = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? translators = freezed,
    Object? price = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_Book(
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String?,
      searchKeyWord: searchKeyWord == freezed
          ? _value.searchKeyWord
          : searchKeyWord // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starUserKey: starUserKey == freezed
          ? _value.starUserKey
          : starUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double?,
      favoriteUserKey: favoriteUserKey == freezed
          ? _value.favoriteUserKey
          : favoriteUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favoriteRating: favoriteRating == freezed
          ? _value.favoriteRating
          : favoriteRating // ignore: cast_nullable_to_non_nullable
              as double?,
      bookmarkUserKey: bookmarkUserKey == freezed
          ? _value.bookmarkUserKey
          : bookmarkUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isbn10: isbn10 == freezed
          ? _value.isbn10
          : isbn10 // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String?,
      isAudlt: isAudlt == freezed
          ? _value.isAudlt
          : isAudlt // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastReviewCreatedAt: lastReviewCreatedAt == freezed
          ? _value.lastReviewCreatedAt
          : lastReviewCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      translators: translators == freezed
          ? _value.translators
          : translators // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book extends _Book {
  const _$_Book(
      {required this.docKey,
      required this.searchKeyWord,
      required this.starUserKey,
      required this.starRating,
      required this.favoriteUserKey,
      required this.favoriteRating,
      required this.bookmarkUserKey,
      required this.isbn10,
      required this.isbn13,
      required this.isAudlt,
      required this.title,
      required this.contents,
      required this.url,
      required this.isbn,
      required this.datetime,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.lastReviewCreatedAt,
      required this.authors,
      required this.publisher,
      required this.translators,
      required this.price,
      required this.thumbnail})
      : super._();

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String? docKey;
  @override
  final List<String>? searchKeyWord;
  @override
  final List<String>? starUserKey;
  @override
  final double? starRating;
  @override
  final List<String>? favoriteUserKey;
  @override
  final double? favoriteRating;
  @override
  final List<String>? bookmarkUserKey;
  @override
  final String? isbn10;
  @override
  final String? isbn13;
  @override
  final bool? isAudlt;
  @override
  final String title;
  @override
  final String contents;
  @override
  final String url;
  @override
  final String isbn;
  @override
  final DateTime? datetime;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? lastReviewCreatedAt;
  @override
  final List<String> authors;
  @override
  final String publisher;
  @override
  final List<String> translators;
  @override
  final int price;
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'Book(docKey: $docKey, searchKeyWord: $searchKeyWord, starUserKey: $starUserKey, starRating: $starRating, favoriteUserKey: $favoriteUserKey, favoriteRating: $favoriteRating, bookmarkUserKey: $bookmarkUserKey, isbn10: $isbn10, isbn13: $isbn13, isAudlt: $isAudlt, title: $title, contents: $contents, url: $url, isbn: $isbn, datetime: $datetime, createdAt: $createdAt, lastReviewCreatedAt: $lastReviewCreatedAt, authors: $authors, publisher: $publisher, translators: $translators, price: $price, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality()
                .equals(other.searchKeyWord, searchKeyWord) &&
            const DeepCollectionEquality()
                .equals(other.starUserKey, starUserKey) &&
            const DeepCollectionEquality()
                .equals(other.starRating, starRating) &&
            const DeepCollectionEquality()
                .equals(other.favoriteUserKey, favoriteUserKey) &&
            const DeepCollectionEquality()
                .equals(other.favoriteRating, favoriteRating) &&
            const DeepCollectionEquality()
                .equals(other.bookmarkUserKey, bookmarkUserKey) &&
            const DeepCollectionEquality().equals(other.isbn10, isbn10) &&
            const DeepCollectionEquality().equals(other.isbn13, isbn13) &&
            const DeepCollectionEquality().equals(other.isAudlt, isAudlt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.isbn, isbn) &&
            const DeepCollectionEquality().equals(other.datetime, datetime) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.lastReviewCreatedAt, lastReviewCreatedAt) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.publisher, publisher) &&
            const DeepCollectionEquality()
                .equals(other.translators, translators) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(docKey),
        const DeepCollectionEquality().hash(searchKeyWord),
        const DeepCollectionEquality().hash(starUserKey),
        const DeepCollectionEquality().hash(starRating),
        const DeepCollectionEquality().hash(favoriteUserKey),
        const DeepCollectionEquality().hash(favoriteRating),
        const DeepCollectionEquality().hash(bookmarkUserKey),
        const DeepCollectionEquality().hash(isbn10),
        const DeepCollectionEquality().hash(isbn13),
        const DeepCollectionEquality().hash(isAudlt),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(contents),
        const DeepCollectionEquality().hash(url),
        const DeepCollectionEquality().hash(isbn),
        const DeepCollectionEquality().hash(datetime),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(lastReviewCreatedAt),
        const DeepCollectionEquality().hash(authors),
        const DeepCollectionEquality().hash(publisher),
        const DeepCollectionEquality().hash(translators),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(thumbnail)
      ]);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(this);
  }
}

abstract class _Book extends Book {
  const factory _Book(
      {required String? docKey,
      required List<String>? searchKeyWord,
      required List<String>? starUserKey,
      required double? starRating,
      required List<String>? favoriteUserKey,
      required double? favoriteRating,
      required List<String>? bookmarkUserKey,
      required String? isbn10,
      required String? isbn13,
      required bool? isAudlt,
      required String title,
      required String contents,
      required String url,
      required String isbn,
      required DateTime? datetime,
      @TimestampConverter() required DateTime? createdAt,
      @TimestampConverter() required DateTime? lastReviewCreatedAt,
      required List<String> authors,
      required String publisher,
      required List<String> translators,
      required int price,
      required String thumbnail}) = _$_Book;
  const _Book._() : super._();

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String? get docKey;
  @override
  List<String>? get searchKeyWord;
  @override
  List<String>? get starUserKey;
  @override
  double? get starRating;
  @override
  List<String>? get favoriteUserKey;
  @override
  double? get favoriteRating;
  @override
  List<String>? get bookmarkUserKey;
  @override
  String? get isbn10;
  @override
  String? get isbn13;
  @override
  bool? get isAudlt;
  @override
  String get title;
  @override
  String get contents;
  @override
  String get url;
  @override
  String get isbn;
  @override
  DateTime? get datetime;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get lastReviewCreatedAt;
  @override
  List<String> get authors;
  @override
  String get publisher;
  @override
  List<String> get translators;
  @override
  int get price;
  @override
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
