// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kakao_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KakaoBook _$KakaoBookFromJson(Map<String, dynamic> json) {
  return _KakaoBook.fromJson(json);
}

/// @nodoc
class _$KakaoBookTearOff {
  const _$KakaoBookTearOff();

  _KakaoBook call(
      {required KakaoBookMeta meta, required List<Book> documents}) {
    return _KakaoBook(
      meta: meta,
      documents: documents,
    );
  }

  KakaoBook fromJson(Map<String, Object?> json) {
    return KakaoBook.fromJson(json);
  }
}

/// @nodoc
const $KakaoBook = _$KakaoBookTearOff();

/// @nodoc
mixin _$KakaoBook {
  KakaoBookMeta get meta => throw _privateConstructorUsedError;
  List<Book> get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KakaoBookCopyWith<KakaoBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KakaoBookCopyWith<$Res> {
  factory $KakaoBookCopyWith(KakaoBook value, $Res Function(KakaoBook) then) =
      _$KakaoBookCopyWithImpl<$Res>;
  $Res call({KakaoBookMeta meta, List<Book> documents});

  $KakaoBookMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$KakaoBookCopyWithImpl<$Res> implements $KakaoBookCopyWith<$Res> {
  _$KakaoBookCopyWithImpl(this._value, this._then);

  final KakaoBook _value;
  // ignore: unused_field
  final $Res Function(KakaoBook) _then;

  @override
  $Res call({
    Object? meta = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as KakaoBookMeta,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }

  @override
  $KakaoBookMetaCopyWith<$Res> get meta {
    return $KakaoBookMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$KakaoBookCopyWith<$Res> implements $KakaoBookCopyWith<$Res> {
  factory _$KakaoBookCopyWith(
          _KakaoBook value, $Res Function(_KakaoBook) then) =
      __$KakaoBookCopyWithImpl<$Res>;
  @override
  $Res call({KakaoBookMeta meta, List<Book> documents});

  @override
  $KakaoBookMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$KakaoBookCopyWithImpl<$Res> extends _$KakaoBookCopyWithImpl<$Res>
    implements _$KakaoBookCopyWith<$Res> {
  __$KakaoBookCopyWithImpl(_KakaoBook _value, $Res Function(_KakaoBook) _then)
      : super(_value, (v) => _then(v as _KakaoBook));

  @override
  _KakaoBook get _value => super._value as _KakaoBook;

  @override
  $Res call({
    Object? meta = freezed,
    Object? documents = freezed,
  }) {
    return _then(_KakaoBook(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as KakaoBookMeta,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KakaoBook implements _KakaoBook {
  const _$_KakaoBook({required this.meta, required this.documents});

  factory _$_KakaoBook.fromJson(Map<String, dynamic> json) =>
      _$$_KakaoBookFromJson(json);

  @override
  final KakaoBookMeta meta;
  @override
  final List<Book> documents;

  @override
  String toString() {
    return 'KakaoBook(meta: $meta, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KakaoBook &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality().equals(other.documents, documents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(documents));

  @JsonKey(ignore: true)
  @override
  _$KakaoBookCopyWith<_KakaoBook> get copyWith =>
      __$KakaoBookCopyWithImpl<_KakaoBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KakaoBookToJson(this);
  }
}

abstract class _KakaoBook implements KakaoBook {
  const factory _KakaoBook(
      {required KakaoBookMeta meta,
      required List<Book> documents}) = _$_KakaoBook;

  factory _KakaoBook.fromJson(Map<String, dynamic> json) =
      _$_KakaoBook.fromJson;

  @override
  KakaoBookMeta get meta;
  @override
  List<Book> get documents;
  @override
  @JsonKey(ignore: true)
  _$KakaoBookCopyWith<_KakaoBook> get copyWith =>
      throw _privateConstructorUsedError;
}

KakaoBookMeta _$KakaoBookMetaFromJson(Map<String, dynamic> json) {
  return _KakaoBookMeta.fromJson(json);
}

/// @nodoc
class _$KakaoBookMetaTearOff {
  const _$KakaoBookMetaTearOff();

  _KakaoBookMeta call(
      {@JsonKey(name: "is_end") required bool isEnd,
      @JsonKey(name: "pageable_count") required int pageableCount,
      @JsonKey(name: "total_count") required int totalCount}) {
    return _KakaoBookMeta(
      isEnd: isEnd,
      pageableCount: pageableCount,
      totalCount: totalCount,
    );
  }

  KakaoBookMeta fromJson(Map<String, Object?> json) {
    return KakaoBookMeta.fromJson(json);
  }
}

/// @nodoc
const $KakaoBookMeta = _$KakaoBookMetaTearOff();

/// @nodoc
mixin _$KakaoBookMeta {
  @JsonKey(name: "is_end")
  bool get isEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "pageable_count")
  int get pageableCount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KakaoBookMetaCopyWith<KakaoBookMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KakaoBookMetaCopyWith<$Res> {
  factory $KakaoBookMetaCopyWith(
          KakaoBookMeta value, $Res Function(KakaoBookMeta) then) =
      _$KakaoBookMetaCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "is_end") bool isEnd,
      @JsonKey(name: "pageable_count") int pageableCount,
      @JsonKey(name: "total_count") int totalCount});
}

/// @nodoc
class _$KakaoBookMetaCopyWithImpl<$Res>
    implements $KakaoBookMetaCopyWith<$Res> {
  _$KakaoBookMetaCopyWithImpl(this._value, this._then);

  final KakaoBookMeta _value;
  // ignore: unused_field
  final $Res Function(KakaoBookMeta) _then;

  @override
  $Res call({
    Object? isEnd = freezed,
    Object? pageableCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      isEnd: isEnd == freezed
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      pageableCount: pageableCount == freezed
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$KakaoBookMetaCopyWith<$Res>
    implements $KakaoBookMetaCopyWith<$Res> {
  factory _$KakaoBookMetaCopyWith(
          _KakaoBookMeta value, $Res Function(_KakaoBookMeta) then) =
      __$KakaoBookMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "is_end") bool isEnd,
      @JsonKey(name: "pageable_count") int pageableCount,
      @JsonKey(name: "total_count") int totalCount});
}

/// @nodoc
class __$KakaoBookMetaCopyWithImpl<$Res>
    extends _$KakaoBookMetaCopyWithImpl<$Res>
    implements _$KakaoBookMetaCopyWith<$Res> {
  __$KakaoBookMetaCopyWithImpl(
      _KakaoBookMeta _value, $Res Function(_KakaoBookMeta) _then)
      : super(_value, (v) => _then(v as _KakaoBookMeta));

  @override
  _KakaoBookMeta get _value => super._value as _KakaoBookMeta;

  @override
  $Res call({
    Object? isEnd = freezed,
    Object? pageableCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_KakaoBookMeta(
      isEnd: isEnd == freezed
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      pageableCount: pageableCount == freezed
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KakaoBookMeta implements _KakaoBookMeta {
  const _$_KakaoBookMeta(
      {@JsonKey(name: "is_end") required this.isEnd,
      @JsonKey(name: "pageable_count") required this.pageableCount,
      @JsonKey(name: "total_count") required this.totalCount});

  factory _$_KakaoBookMeta.fromJson(Map<String, dynamic> json) =>
      _$$_KakaoBookMetaFromJson(json);

  @override
  @JsonKey(name: "is_end")
  final bool isEnd;
  @override
  @JsonKey(name: "pageable_count")
  final int pageableCount;
  @override
  @JsonKey(name: "total_count")
  final int totalCount;

  @override
  String toString() {
    return 'KakaoBookMeta(isEnd: $isEnd, pageableCount: $pageableCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KakaoBookMeta &&
            const DeepCollectionEquality().equals(other.isEnd, isEnd) &&
            const DeepCollectionEquality()
                .equals(other.pageableCount, pageableCount) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isEnd),
      const DeepCollectionEquality().hash(pageableCount),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$KakaoBookMetaCopyWith<_KakaoBookMeta> get copyWith =>
      __$KakaoBookMetaCopyWithImpl<_KakaoBookMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KakaoBookMetaToJson(this);
  }
}

abstract class _KakaoBookMeta implements KakaoBookMeta {
  const factory _KakaoBookMeta(
          {@JsonKey(name: "is_end") required bool isEnd,
          @JsonKey(name: "pageable_count") required int pageableCount,
          @JsonKey(name: "total_count") required int totalCount}) =
      _$_KakaoBookMeta;

  factory _KakaoBookMeta.fromJson(Map<String, dynamic> json) =
      _$_KakaoBookMeta.fromJson;

  @override
  @JsonKey(name: "is_end")
  bool get isEnd;
  @override
  @JsonKey(name: "pageable_count")
  int get pageableCount;
  @override
  @JsonKey(name: "total_count")
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$KakaoBookMetaCopyWith<_KakaoBookMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
