// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerService _$CustomerServiceFromJson(Map<String, dynamic> json) {
  return _CustomerService.fromJson(json);
}

/// @nodoc
class _$CustomerServiceTearOff {
  const _$CustomerServiceTearOff();

  _CustomerService call(
      {required String category,
      required String docKey,
      required String userKey,
      required String content,
      required String email,
      @TimestampConverter() required DateTime createdAt,
      required bool isComment,
      required String comment,
      @TimestampConverter() required DateTime commentCreatedAt}) {
    return _CustomerService(
      category: category,
      docKey: docKey,
      userKey: userKey,
      content: content,
      email: email,
      createdAt: createdAt,
      isComment: isComment,
      comment: comment,
      commentCreatedAt: commentCreatedAt,
    );
  }

  CustomerService fromJson(Map<String, Object?> json) {
    return CustomerService.fromJson(json);
  }
}

/// @nodoc
const $CustomerService = _$CustomerServiceTearOff();

/// @nodoc
mixin _$CustomerService {
  String get category => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get userKey => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isComment => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get commentCreatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerServiceCopyWith<CustomerService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerServiceCopyWith<$Res> {
  factory $CustomerServiceCopyWith(
          CustomerService value, $Res Function(CustomerService) then) =
      _$CustomerServiceCopyWithImpl<$Res>;
  $Res call(
      {String category,
      String docKey,
      String userKey,
      String content,
      String email,
      @TimestampConverter() DateTime createdAt,
      bool isComment,
      String comment,
      @TimestampConverter() DateTime commentCreatedAt});
}

/// @nodoc
class _$CustomerServiceCopyWithImpl<$Res>
    implements $CustomerServiceCopyWith<$Res> {
  _$CustomerServiceCopyWithImpl(this._value, this._then);

  final CustomerService _value;
  // ignore: unused_field
  final $Res Function(CustomerService) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? docKey = freezed,
    Object? userKey = freezed,
    Object? content = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? isComment = freezed,
    Object? comment = freezed,
    Object? commentCreatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isComment: isComment == freezed
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentCreatedAt: commentCreatedAt == freezed
          ? _value.commentCreatedAt
          : commentCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CustomerServiceCopyWith<$Res>
    implements $CustomerServiceCopyWith<$Res> {
  factory _$CustomerServiceCopyWith(
          _CustomerService value, $Res Function(_CustomerService) then) =
      __$CustomerServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String category,
      String docKey,
      String userKey,
      String content,
      String email,
      @TimestampConverter() DateTime createdAt,
      bool isComment,
      String comment,
      @TimestampConverter() DateTime commentCreatedAt});
}

/// @nodoc
class __$CustomerServiceCopyWithImpl<$Res>
    extends _$CustomerServiceCopyWithImpl<$Res>
    implements _$CustomerServiceCopyWith<$Res> {
  __$CustomerServiceCopyWithImpl(
      _CustomerService _value, $Res Function(_CustomerService) _then)
      : super(_value, (v) => _then(v as _CustomerService));

  @override
  _CustomerService get _value => super._value as _CustomerService;

  @override
  $Res call({
    Object? category = freezed,
    Object? docKey = freezed,
    Object? userKey = freezed,
    Object? content = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? isComment = freezed,
    Object? comment = freezed,
    Object? commentCreatedAt = freezed,
  }) {
    return _then(_CustomerService(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isComment: isComment == freezed
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentCreatedAt: commentCreatedAt == freezed
          ? _value.commentCreatedAt
          : commentCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerService implements _CustomerService {
  const _$_CustomerService(
      {required this.category,
      required this.docKey,
      required this.userKey,
      required this.content,
      required this.email,
      @TimestampConverter() required this.createdAt,
      required this.isComment,
      required this.comment,
      @TimestampConverter() required this.commentCreatedAt});

  factory _$_CustomerService.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerServiceFromJson(json);

  @override
  final String category;
  @override
  final String docKey;
  @override
  final String userKey;
  @override
  final String content;
  @override
  final String email;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final bool isComment;
  @override
  final String comment;
  @override
  @TimestampConverter()
  final DateTime commentCreatedAt;

  @override
  String toString() {
    return 'CustomerService(category: $category, docKey: $docKey, userKey: $userKey, content: $content, email: $email, createdAt: $createdAt, isComment: $isComment, comment: $comment, commentCreatedAt: $commentCreatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerService &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isComment, isComment) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.commentCreatedAt, commentCreatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isComment),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(commentCreatedAt));

  @JsonKey(ignore: true)
  @override
  _$CustomerServiceCopyWith<_CustomerService> get copyWith =>
      __$CustomerServiceCopyWithImpl<_CustomerService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerServiceToJson(this);
  }
}

abstract class _CustomerService implements CustomerService {
  const factory _CustomerService(
          {required String category,
          required String docKey,
          required String userKey,
          required String content,
          required String email,
          @TimestampConverter() required DateTime createdAt,
          required bool isComment,
          required String comment,
          @TimestampConverter() required DateTime commentCreatedAt}) =
      _$_CustomerService;

  factory _CustomerService.fromJson(Map<String, dynamic> json) =
      _$_CustomerService.fromJson;

  @override
  String get category;
  @override
  String get docKey;
  @override
  String get userKey;
  @override
  String get content;
  @override
  String get email;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  bool get isComment;
  @override
  String get comment;
  @override
  @TimestampConverter()
  DateTime get commentCreatedAt;
  @override
  @JsonKey(ignore: true)
  _$CustomerServiceCopyWith<_CustomerService> get copyWith =>
      throw _privateConstructorUsedError;
}
