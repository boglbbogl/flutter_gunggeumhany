// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PreferenceModel _$PreferenceModelFromJson(Map<String, dynamic> json) {
  return _PreferenceModel.fromJson(json);
}

/// @nodoc
class _$PreferenceModelTearOff {
  const _$PreferenceModelTearOff();

  _PreferenceModel call(
      {required String isbn13,
      required String isbn10,
      required String title,
      required List<String> category,
      required double starRating}) {
    return _PreferenceModel(
      isbn13: isbn13,
      isbn10: isbn10,
      title: title,
      category: category,
      starRating: starRating,
    );
  }

  PreferenceModel fromJson(Map<String, Object?> json) {
    return PreferenceModel.fromJson(json);
  }
}

/// @nodoc
const $PreferenceModel = _$PreferenceModelTearOff();

/// @nodoc
mixin _$PreferenceModel {
  String get isbn13 => throw _privateConstructorUsedError;
  String get isbn10 => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  double get starRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceModelCopyWith<PreferenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceModelCopyWith<$Res> {
  factory $PreferenceModelCopyWith(
          PreferenceModel value, $Res Function(PreferenceModel) then) =
      _$PreferenceModelCopyWithImpl<$Res>;
  $Res call(
      {String isbn13,
      String isbn10,
      String title,
      List<String> category,
      double starRating});
}

/// @nodoc
class _$PreferenceModelCopyWithImpl<$Res>
    implements $PreferenceModelCopyWith<$Res> {
  _$PreferenceModelCopyWithImpl(this._value, this._then);

  final PreferenceModel _value;
  // ignore: unused_field
  final $Res Function(PreferenceModel) _then;

  @override
  $Res call({
    Object? isbn13 = freezed,
    Object? isbn10 = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? starRating = freezed,
  }) {
    return _then(_value.copyWith(
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      isbn10: isbn10 == freezed
          ? _value.isbn10
          : isbn10 // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PreferenceModelCopyWith<$Res>
    implements $PreferenceModelCopyWith<$Res> {
  factory _$PreferenceModelCopyWith(
          _PreferenceModel value, $Res Function(_PreferenceModel) then) =
      __$PreferenceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String isbn13,
      String isbn10,
      String title,
      List<String> category,
      double starRating});
}

/// @nodoc
class __$PreferenceModelCopyWithImpl<$Res>
    extends _$PreferenceModelCopyWithImpl<$Res>
    implements _$PreferenceModelCopyWith<$Res> {
  __$PreferenceModelCopyWithImpl(
      _PreferenceModel _value, $Res Function(_PreferenceModel) _then)
      : super(_value, (v) => _then(v as _PreferenceModel));

  @override
  _PreferenceModel get _value => super._value as _PreferenceModel;

  @override
  $Res call({
    Object? isbn13 = freezed,
    Object? isbn10 = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? starRating = freezed,
  }) {
    return _then(_PreferenceModel(
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      isbn10: isbn10 == freezed
          ? _value.isbn10
          : isbn10 // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      starRating: starRating == freezed
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PreferenceModel extends _PreferenceModel {
  const _$_PreferenceModel(
      {required this.isbn13,
      required this.isbn10,
      required this.title,
      required this.category,
      required this.starRating})
      : super._();

  factory _$_PreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$$_PreferenceModelFromJson(json);

  @override
  final String isbn13;
  @override
  final String isbn10;
  @override
  final String title;
  @override
  final List<String> category;
  @override
  final double starRating;

  @override
  String toString() {
    return 'PreferenceModel(isbn13: $isbn13, isbn10: $isbn10, title: $title, category: $category, starRating: $starRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferenceModel &&
            const DeepCollectionEquality().equals(other.isbn13, isbn13) &&
            const DeepCollectionEquality().equals(other.isbn10, isbn10) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.starRating, starRating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isbn13),
      const DeepCollectionEquality().hash(isbn10),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(starRating));

  @JsonKey(ignore: true)
  @override
  _$PreferenceModelCopyWith<_PreferenceModel> get copyWith =>
      __$PreferenceModelCopyWithImpl<_PreferenceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreferenceModelToJson(this);
  }
}

abstract class _PreferenceModel extends PreferenceModel {
  const factory _PreferenceModel(
      {required String isbn13,
      required String isbn10,
      required String title,
      required List<String> category,
      required double starRating}) = _$_PreferenceModel;
  const _PreferenceModel._() : super._();

  factory _PreferenceModel.fromJson(Map<String, dynamic> json) =
      _$_PreferenceModel.fromJson;

  @override
  String get isbn13;
  @override
  String get isbn10;
  @override
  String get title;
  @override
  List<String> get category;
  @override
  double get starRating;
  @override
  @JsonKey(ignore: true)
  _$PreferenceModelCopyWith<_PreferenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
