// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'aladin_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AladinPrice _$AladinPriceFromJson(Map<String, dynamic> json) {
  return _AladinPrice.fromJson(json);
}

/// @nodoc
class _$AladinPriceTearOff {
  const _$AladinPriceTearOff();

  _AladinPrice call(
      {required int priceStandard,
      required int priceSales,
      required AladinPriceSubInfo subInfo}) {
    return _AladinPrice(
      priceStandard: priceStandard,
      priceSales: priceSales,
      subInfo: subInfo,
    );
  }

  AladinPrice fromJson(Map<String, Object?> json) {
    return AladinPrice.fromJson(json);
  }
}

/// @nodoc
const $AladinPrice = _$AladinPriceTearOff();

/// @nodoc
mixin _$AladinPrice {
  int get priceStandard => throw _privateConstructorUsedError;
  int get priceSales => throw _privateConstructorUsedError;
  AladinPriceSubInfo get subInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AladinPriceCopyWith<AladinPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AladinPriceCopyWith<$Res> {
  factory $AladinPriceCopyWith(
          AladinPrice value, $Res Function(AladinPrice) then) =
      _$AladinPriceCopyWithImpl<$Res>;
  $Res call({int priceStandard, int priceSales, AladinPriceSubInfo subInfo});

  $AladinPriceSubInfoCopyWith<$Res> get subInfo;
}

/// @nodoc
class _$AladinPriceCopyWithImpl<$Res> implements $AladinPriceCopyWith<$Res> {
  _$AladinPriceCopyWithImpl(this._value, this._then);

  final AladinPrice _value;
  // ignore: unused_field
  final $Res Function(AladinPrice) _then;

  @override
  $Res call({
    Object? priceStandard = freezed,
    Object? priceSales = freezed,
    Object? subInfo = freezed,
  }) {
    return _then(_value.copyWith(
      priceStandard: priceStandard == freezed
          ? _value.priceStandard
          : priceStandard // ignore: cast_nullable_to_non_nullable
              as int,
      priceSales: priceSales == freezed
          ? _value.priceSales
          : priceSales // ignore: cast_nullable_to_non_nullable
              as int,
      subInfo: subInfo == freezed
          ? _value.subInfo
          : subInfo // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfo,
    ));
  }

  @override
  $AladinPriceSubInfoCopyWith<$Res> get subInfo {
    return $AladinPriceSubInfoCopyWith<$Res>(_value.subInfo, (value) {
      return _then(_value.copyWith(subInfo: value));
    });
  }
}

/// @nodoc
abstract class _$AladinPriceCopyWith<$Res>
    implements $AladinPriceCopyWith<$Res> {
  factory _$AladinPriceCopyWith(
          _AladinPrice value, $Res Function(_AladinPrice) then) =
      __$AladinPriceCopyWithImpl<$Res>;
  @override
  $Res call({int priceStandard, int priceSales, AladinPriceSubInfo subInfo});

  @override
  $AladinPriceSubInfoCopyWith<$Res> get subInfo;
}

/// @nodoc
class __$AladinPriceCopyWithImpl<$Res> extends _$AladinPriceCopyWithImpl<$Res>
    implements _$AladinPriceCopyWith<$Res> {
  __$AladinPriceCopyWithImpl(
      _AladinPrice _value, $Res Function(_AladinPrice) _then)
      : super(_value, (v) => _then(v as _AladinPrice));

  @override
  _AladinPrice get _value => super._value as _AladinPrice;

  @override
  $Res call({
    Object? priceStandard = freezed,
    Object? priceSales = freezed,
    Object? subInfo = freezed,
  }) {
    return _then(_AladinPrice(
      priceStandard: priceStandard == freezed
          ? _value.priceStandard
          : priceStandard // ignore: cast_nullable_to_non_nullable
              as int,
      priceSales: priceSales == freezed
          ? _value.priceSales
          : priceSales // ignore: cast_nullable_to_non_nullable
              as int,
      subInfo: subInfo == freezed
          ? _value.subInfo
          : subInfo // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AladinPrice extends _AladinPrice {
  const _$_AladinPrice(
      {required this.priceStandard,
      required this.priceSales,
      required this.subInfo})
      : super._();

  factory _$_AladinPrice.fromJson(Map<String, dynamic> json) =>
      _$$_AladinPriceFromJson(json);

  @override
  final int priceStandard;
  @override
  final int priceSales;
  @override
  final AladinPriceSubInfo subInfo;

  @override
  String toString() {
    return 'AladinPrice(priceStandard: $priceStandard, priceSales: $priceSales, subInfo: $subInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AladinPrice &&
            const DeepCollectionEquality()
                .equals(other.priceStandard, priceStandard) &&
            const DeepCollectionEquality()
                .equals(other.priceSales, priceSales) &&
            const DeepCollectionEquality().equals(other.subInfo, subInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(priceStandard),
      const DeepCollectionEquality().hash(priceSales),
      const DeepCollectionEquality().hash(subInfo));

  @JsonKey(ignore: true)
  @override
  _$AladinPriceCopyWith<_AladinPrice> get copyWith =>
      __$AladinPriceCopyWithImpl<_AladinPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AladinPriceToJson(this);
  }
}

abstract class _AladinPrice extends AladinPrice {
  const factory _AladinPrice(
      {required int priceStandard,
      required int priceSales,
      required AladinPriceSubInfo subInfo}) = _$_AladinPrice;
  const _AladinPrice._() : super._();

  factory _AladinPrice.fromJson(Map<String, dynamic> json) =
      _$_AladinPrice.fromJson;

  @override
  int get priceStandard;
  @override
  int get priceSales;
  @override
  AladinPriceSubInfo get subInfo;
  @override
  @JsonKey(ignore: true)
  _$AladinPriceCopyWith<_AladinPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

AladinPriceSubInfo _$AladinPriceSubInfoFromJson(Map<String, dynamic> json) {
  return _AladinPriceSubInfo.fromJson(json);
}

/// @nodoc
class _$AladinPriceSubInfoTearOff {
  const _$AladinPriceSubInfoTearOff();

  _AladinPriceSubInfo call(
      {required AladinPriceSubInfoEbookList? ebookList,
      required AladinPriceSubInfoUsedList? usedList}) {
    return _AladinPriceSubInfo(
      ebookList: ebookList,
      usedList: usedList,
    );
  }

  AladinPriceSubInfo fromJson(Map<String, Object?> json) {
    return AladinPriceSubInfo.fromJson(json);
  }
}

/// @nodoc
const $AladinPriceSubInfo = _$AladinPriceSubInfoTearOff();

/// @nodoc
mixin _$AladinPriceSubInfo {
  AladinPriceSubInfoEbookList? get ebookList =>
      throw _privateConstructorUsedError;
  AladinPriceSubInfoUsedList? get usedList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AladinPriceSubInfoCopyWith<AladinPriceSubInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AladinPriceSubInfoCopyWith<$Res> {
  factory $AladinPriceSubInfoCopyWith(
          AladinPriceSubInfo value, $Res Function(AladinPriceSubInfo) then) =
      _$AladinPriceSubInfoCopyWithImpl<$Res>;
  $Res call(
      {AladinPriceSubInfoEbookList? ebookList,
      AladinPriceSubInfoUsedList? usedList});

  $AladinPriceSubInfoEbookListCopyWith<$Res>? get ebookList;
  $AladinPriceSubInfoUsedListCopyWith<$Res>? get usedList;
}

/// @nodoc
class _$AladinPriceSubInfoCopyWithImpl<$Res>
    implements $AladinPriceSubInfoCopyWith<$Res> {
  _$AladinPriceSubInfoCopyWithImpl(this._value, this._then);

  final AladinPriceSubInfo _value;
  // ignore: unused_field
  final $Res Function(AladinPriceSubInfo) _then;

  @override
  $Res call({
    Object? ebookList = freezed,
    Object? usedList = freezed,
  }) {
    return _then(_value.copyWith(
      ebookList: ebookList == freezed
          ? _value.ebookList
          : ebookList // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoEbookList?,
      usedList: usedList == freezed
          ? _value.usedList
          : usedList // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUsedList?,
    ));
  }

  @override
  $AladinPriceSubInfoEbookListCopyWith<$Res>? get ebookList {
    if (_value.ebookList == null) {
      return null;
    }

    return $AladinPriceSubInfoEbookListCopyWith<$Res>(_value.ebookList!,
        (value) {
      return _then(_value.copyWith(ebookList: value));
    });
  }

  @override
  $AladinPriceSubInfoUsedListCopyWith<$Res>? get usedList {
    if (_value.usedList == null) {
      return null;
    }

    return $AladinPriceSubInfoUsedListCopyWith<$Res>(_value.usedList!, (value) {
      return _then(_value.copyWith(usedList: value));
    });
  }
}

/// @nodoc
abstract class _$AladinPriceSubInfoCopyWith<$Res>
    implements $AladinPriceSubInfoCopyWith<$Res> {
  factory _$AladinPriceSubInfoCopyWith(
          _AladinPriceSubInfo value, $Res Function(_AladinPriceSubInfo) then) =
      __$AladinPriceSubInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {AladinPriceSubInfoEbookList? ebookList,
      AladinPriceSubInfoUsedList? usedList});

  @override
  $AladinPriceSubInfoEbookListCopyWith<$Res>? get ebookList;
  @override
  $AladinPriceSubInfoUsedListCopyWith<$Res>? get usedList;
}

/// @nodoc
class __$AladinPriceSubInfoCopyWithImpl<$Res>
    extends _$AladinPriceSubInfoCopyWithImpl<$Res>
    implements _$AladinPriceSubInfoCopyWith<$Res> {
  __$AladinPriceSubInfoCopyWithImpl(
      _AladinPriceSubInfo _value, $Res Function(_AladinPriceSubInfo) _then)
      : super(_value, (v) => _then(v as _AladinPriceSubInfo));

  @override
  _AladinPriceSubInfo get _value => super._value as _AladinPriceSubInfo;

  @override
  $Res call({
    Object? ebookList = freezed,
    Object? usedList = freezed,
  }) {
    return _then(_AladinPriceSubInfo(
      ebookList: ebookList == freezed
          ? _value.ebookList
          : ebookList // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoEbookList?,
      usedList: usedList == freezed
          ? _value.usedList
          : usedList // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUsedList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AladinPriceSubInfo implements _AladinPriceSubInfo {
  const _$_AladinPriceSubInfo(
      {required this.ebookList, required this.usedList});

  factory _$_AladinPriceSubInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AladinPriceSubInfoFromJson(json);

  @override
  final AladinPriceSubInfoEbookList? ebookList;
  @override
  final AladinPriceSubInfoUsedList? usedList;

  @override
  String toString() {
    return 'AladinPriceSubInfo(ebookList: $ebookList, usedList: $usedList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AladinPriceSubInfo &&
            const DeepCollectionEquality().equals(other.ebookList, ebookList) &&
            const DeepCollectionEquality().equals(other.usedList, usedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ebookList),
      const DeepCollectionEquality().hash(usedList));

  @JsonKey(ignore: true)
  @override
  _$AladinPriceSubInfoCopyWith<_AladinPriceSubInfo> get copyWith =>
      __$AladinPriceSubInfoCopyWithImpl<_AladinPriceSubInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AladinPriceSubInfoToJson(this);
  }
}

abstract class _AladinPriceSubInfo implements AladinPriceSubInfo {
  const factory _AladinPriceSubInfo(
      {required AladinPriceSubInfoEbookList? ebookList,
      required AladinPriceSubInfoUsedList? usedList}) = _$_AladinPriceSubInfo;

  factory _AladinPriceSubInfo.fromJson(Map<String, dynamic> json) =
      _$_AladinPriceSubInfo.fromJson;

  @override
  AladinPriceSubInfoEbookList? get ebookList;
  @override
  AladinPriceSubInfoUsedList? get usedList;
  @override
  @JsonKey(ignore: true)
  _$AladinPriceSubInfoCopyWith<_AladinPriceSubInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

AladinPriceSubInfoEbookList _$AladinPriceSubInfoEbookListFromJson(
    Map<String, dynamic> json) {
  return _AladinPriceSubInfoEbookList.fromJson(json);
}

/// @nodoc
class _$AladinPriceSubInfoEbookListTearOff {
  const _$AladinPriceSubInfoEbookListTearOff();

  _AladinPriceSubInfoEbookList call(
      {required int priceSales, required String link}) {
    return _AladinPriceSubInfoEbookList(
      priceSales: priceSales,
      link: link,
    );
  }

  AladinPriceSubInfoEbookList fromJson(Map<String, Object?> json) {
    return AladinPriceSubInfoEbookList.fromJson(json);
  }
}

/// @nodoc
const $AladinPriceSubInfoEbookList = _$AladinPriceSubInfoEbookListTearOff();

/// @nodoc
mixin _$AladinPriceSubInfoEbookList {
  int get priceSales => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AladinPriceSubInfoEbookListCopyWith<AladinPriceSubInfoEbookList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AladinPriceSubInfoEbookListCopyWith<$Res> {
  factory $AladinPriceSubInfoEbookListCopyWith(
          AladinPriceSubInfoEbookList value,
          $Res Function(AladinPriceSubInfoEbookList) then) =
      _$AladinPriceSubInfoEbookListCopyWithImpl<$Res>;
  $Res call({int priceSales, String link});
}

/// @nodoc
class _$AladinPriceSubInfoEbookListCopyWithImpl<$Res>
    implements $AladinPriceSubInfoEbookListCopyWith<$Res> {
  _$AladinPriceSubInfoEbookListCopyWithImpl(this._value, this._then);

  final AladinPriceSubInfoEbookList _value;
  // ignore: unused_field
  final $Res Function(AladinPriceSubInfoEbookList) _then;

  @override
  $Res call({
    Object? priceSales = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      priceSales: priceSales == freezed
          ? _value.priceSales
          : priceSales // ignore: cast_nullable_to_non_nullable
              as int,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AladinPriceSubInfoEbookListCopyWith<$Res>
    implements $AladinPriceSubInfoEbookListCopyWith<$Res> {
  factory _$AladinPriceSubInfoEbookListCopyWith(
          _AladinPriceSubInfoEbookList value,
          $Res Function(_AladinPriceSubInfoEbookList) then) =
      __$AladinPriceSubInfoEbookListCopyWithImpl<$Res>;
  @override
  $Res call({int priceSales, String link});
}

/// @nodoc
class __$AladinPriceSubInfoEbookListCopyWithImpl<$Res>
    extends _$AladinPriceSubInfoEbookListCopyWithImpl<$Res>
    implements _$AladinPriceSubInfoEbookListCopyWith<$Res> {
  __$AladinPriceSubInfoEbookListCopyWithImpl(
      _AladinPriceSubInfoEbookList _value,
      $Res Function(_AladinPriceSubInfoEbookList) _then)
      : super(_value, (v) => _then(v as _AladinPriceSubInfoEbookList));

  @override
  _AladinPriceSubInfoEbookList get _value =>
      super._value as _AladinPriceSubInfoEbookList;

  @override
  $Res call({
    Object? priceSales = freezed,
    Object? link = freezed,
  }) {
    return _then(_AladinPriceSubInfoEbookList(
      priceSales: priceSales == freezed
          ? _value.priceSales
          : priceSales // ignore: cast_nullable_to_non_nullable
              as int,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AladinPriceSubInfoEbookList implements _AladinPriceSubInfoEbookList {
  const _$_AladinPriceSubInfoEbookList(
      {required this.priceSales, required this.link});

  factory _$_AladinPriceSubInfoEbookList.fromJson(Map<String, dynamic> json) =>
      _$$_AladinPriceSubInfoEbookListFromJson(json);

  @override
  final int priceSales;
  @override
  final String link;

  @override
  String toString() {
    return 'AladinPriceSubInfoEbookList(priceSales: $priceSales, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AladinPriceSubInfoEbookList &&
            const DeepCollectionEquality()
                .equals(other.priceSales, priceSales) &&
            const DeepCollectionEquality().equals(other.link, link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(priceSales),
      const DeepCollectionEquality().hash(link));

  @JsonKey(ignore: true)
  @override
  _$AladinPriceSubInfoEbookListCopyWith<_AladinPriceSubInfoEbookList>
      get copyWith => __$AladinPriceSubInfoEbookListCopyWithImpl<
          _AladinPriceSubInfoEbookList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AladinPriceSubInfoEbookListToJson(this);
  }
}

abstract class _AladinPriceSubInfoEbookList
    implements AladinPriceSubInfoEbookList {
  const factory _AladinPriceSubInfoEbookList(
      {required int priceSales,
      required String link}) = _$_AladinPriceSubInfoEbookList;

  factory _AladinPriceSubInfoEbookList.fromJson(Map<String, dynamic> json) =
      _$_AladinPriceSubInfoEbookList.fromJson;

  @override
  int get priceSales;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$AladinPriceSubInfoEbookListCopyWith<_AladinPriceSubInfoEbookList>
      get copyWith => throw _privateConstructorUsedError;
}

AladinPriceSubInfoUsedList _$AladinPriceSubInfoUsedListFromJson(
    Map<String, dynamic> json) {
  return _AladinPriceSubInfoUsedList.fromJson(json);
}

/// @nodoc
class _$AladinPriceSubInfoUsedListTearOff {
  const _$AladinPriceSubInfoUsedListTearOff();

  _AladinPriceSubInfoUsedList call(
      {required AladinPriceSubInfoUserListUsed? aladinUsed,
      required AladinPriceSubInfoUserListUsed? userUsed}) {
    return _AladinPriceSubInfoUsedList(
      aladinUsed: aladinUsed,
      userUsed: userUsed,
    );
  }

  AladinPriceSubInfoUsedList fromJson(Map<String, Object?> json) {
    return AladinPriceSubInfoUsedList.fromJson(json);
  }
}

/// @nodoc
const $AladinPriceSubInfoUsedList = _$AladinPriceSubInfoUsedListTearOff();

/// @nodoc
mixin _$AladinPriceSubInfoUsedList {
  AladinPriceSubInfoUserListUsed? get aladinUsed =>
      throw _privateConstructorUsedError;
  AladinPriceSubInfoUserListUsed? get userUsed =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AladinPriceSubInfoUsedListCopyWith<AladinPriceSubInfoUsedList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AladinPriceSubInfoUsedListCopyWith<$Res> {
  factory $AladinPriceSubInfoUsedListCopyWith(AladinPriceSubInfoUsedList value,
          $Res Function(AladinPriceSubInfoUsedList) then) =
      _$AladinPriceSubInfoUsedListCopyWithImpl<$Res>;
  $Res call(
      {AladinPriceSubInfoUserListUsed? aladinUsed,
      AladinPriceSubInfoUserListUsed? userUsed});

  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get aladinUsed;
  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get userUsed;
}

/// @nodoc
class _$AladinPriceSubInfoUsedListCopyWithImpl<$Res>
    implements $AladinPriceSubInfoUsedListCopyWith<$Res> {
  _$AladinPriceSubInfoUsedListCopyWithImpl(this._value, this._then);

  final AladinPriceSubInfoUsedList _value;
  // ignore: unused_field
  final $Res Function(AladinPriceSubInfoUsedList) _then;

  @override
  $Res call({
    Object? aladinUsed = freezed,
    Object? userUsed = freezed,
  }) {
    return _then(_value.copyWith(
      aladinUsed: aladinUsed == freezed
          ? _value.aladinUsed
          : aladinUsed // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUserListUsed?,
      userUsed: userUsed == freezed
          ? _value.userUsed
          : userUsed // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUserListUsed?,
    ));
  }

  @override
  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get aladinUsed {
    if (_value.aladinUsed == null) {
      return null;
    }

    return $AladinPriceSubInfoUserListUsedCopyWith<$Res>(_value.aladinUsed!,
        (value) {
      return _then(_value.copyWith(aladinUsed: value));
    });
  }

  @override
  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get userUsed {
    if (_value.userUsed == null) {
      return null;
    }

    return $AladinPriceSubInfoUserListUsedCopyWith<$Res>(_value.userUsed!,
        (value) {
      return _then(_value.copyWith(userUsed: value));
    });
  }
}

/// @nodoc
abstract class _$AladinPriceSubInfoUsedListCopyWith<$Res>
    implements $AladinPriceSubInfoUsedListCopyWith<$Res> {
  factory _$AladinPriceSubInfoUsedListCopyWith(
          _AladinPriceSubInfoUsedList value,
          $Res Function(_AladinPriceSubInfoUsedList) then) =
      __$AladinPriceSubInfoUsedListCopyWithImpl<$Res>;
  @override
  $Res call(
      {AladinPriceSubInfoUserListUsed? aladinUsed,
      AladinPriceSubInfoUserListUsed? userUsed});

  @override
  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get aladinUsed;
  @override
  $AladinPriceSubInfoUserListUsedCopyWith<$Res>? get userUsed;
}

/// @nodoc
class __$AladinPriceSubInfoUsedListCopyWithImpl<$Res>
    extends _$AladinPriceSubInfoUsedListCopyWithImpl<$Res>
    implements _$AladinPriceSubInfoUsedListCopyWith<$Res> {
  __$AladinPriceSubInfoUsedListCopyWithImpl(_AladinPriceSubInfoUsedList _value,
      $Res Function(_AladinPriceSubInfoUsedList) _then)
      : super(_value, (v) => _then(v as _AladinPriceSubInfoUsedList));

  @override
  _AladinPriceSubInfoUsedList get _value =>
      super._value as _AladinPriceSubInfoUsedList;

  @override
  $Res call({
    Object? aladinUsed = freezed,
    Object? userUsed = freezed,
  }) {
    return _then(_AladinPriceSubInfoUsedList(
      aladinUsed: aladinUsed == freezed
          ? _value.aladinUsed
          : aladinUsed // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUserListUsed?,
      userUsed: userUsed == freezed
          ? _value.userUsed
          : userUsed // ignore: cast_nullable_to_non_nullable
              as AladinPriceSubInfoUserListUsed?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AladinPriceSubInfoUsedList implements _AladinPriceSubInfoUsedList {
  const _$_AladinPriceSubInfoUsedList(
      {required this.aladinUsed, required this.userUsed});

  factory _$_AladinPriceSubInfoUsedList.fromJson(Map<String, dynamic> json) =>
      _$$_AladinPriceSubInfoUsedListFromJson(json);

  @override
  final AladinPriceSubInfoUserListUsed? aladinUsed;
  @override
  final AladinPriceSubInfoUserListUsed? userUsed;

  @override
  String toString() {
    return 'AladinPriceSubInfoUsedList(aladinUsed: $aladinUsed, userUsed: $userUsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AladinPriceSubInfoUsedList &&
            const DeepCollectionEquality()
                .equals(other.aladinUsed, aladinUsed) &&
            const DeepCollectionEquality().equals(other.userUsed, userUsed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(aladinUsed),
      const DeepCollectionEquality().hash(userUsed));

  @JsonKey(ignore: true)
  @override
  _$AladinPriceSubInfoUsedListCopyWith<_AladinPriceSubInfoUsedList>
      get copyWith => __$AladinPriceSubInfoUsedListCopyWithImpl<
          _AladinPriceSubInfoUsedList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AladinPriceSubInfoUsedListToJson(this);
  }
}

abstract class _AladinPriceSubInfoUsedList
    implements AladinPriceSubInfoUsedList {
  const factory _AladinPriceSubInfoUsedList(
          {required AladinPriceSubInfoUserListUsed? aladinUsed,
          required AladinPriceSubInfoUserListUsed? userUsed}) =
      _$_AladinPriceSubInfoUsedList;

  factory _AladinPriceSubInfoUsedList.fromJson(Map<String, dynamic> json) =
      _$_AladinPriceSubInfoUsedList.fromJson;

  @override
  AladinPriceSubInfoUserListUsed? get aladinUsed;
  @override
  AladinPriceSubInfoUserListUsed? get userUsed;
  @override
  @JsonKey(ignore: true)
  _$AladinPriceSubInfoUsedListCopyWith<_AladinPriceSubInfoUsedList>
      get copyWith => throw _privateConstructorUsedError;
}

AladinPriceSubInfoUserListUsed _$AladinPriceSubInfoUserListUsedFromJson(
    Map<String, dynamic> json) {
  return _AladinPriceSubInfoUserListUsed.fromJson(json);
}

/// @nodoc
class _$AladinPriceSubInfoUserListUsedTearOff {
  const _$AladinPriceSubInfoUserListUsedTearOff();

  _AladinPriceSubInfoUserListUsed call(
      {required int itemCount, required int minPrice, required String link}) {
    return _AladinPriceSubInfoUserListUsed(
      itemCount: itemCount,
      minPrice: minPrice,
      link: link,
    );
  }

  AladinPriceSubInfoUserListUsed fromJson(Map<String, Object?> json) {
    return AladinPriceSubInfoUserListUsed.fromJson(json);
  }
}

/// @nodoc
const $AladinPriceSubInfoUserListUsed =
    _$AladinPriceSubInfoUserListUsedTearOff();

/// @nodoc
mixin _$AladinPriceSubInfoUserListUsed {
  int get itemCount => throw _privateConstructorUsedError;
  int get minPrice => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AladinPriceSubInfoUserListUsedCopyWith<AladinPriceSubInfoUserListUsed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AladinPriceSubInfoUserListUsedCopyWith<$Res> {
  factory $AladinPriceSubInfoUserListUsedCopyWith(
          AladinPriceSubInfoUserListUsed value,
          $Res Function(AladinPriceSubInfoUserListUsed) then) =
      _$AladinPriceSubInfoUserListUsedCopyWithImpl<$Res>;
  $Res call({int itemCount, int minPrice, String link});
}

/// @nodoc
class _$AladinPriceSubInfoUserListUsedCopyWithImpl<$Res>
    implements $AladinPriceSubInfoUserListUsedCopyWith<$Res> {
  _$AladinPriceSubInfoUserListUsedCopyWithImpl(this._value, this._then);

  final AladinPriceSubInfoUserListUsed _value;
  // ignore: unused_field
  final $Res Function(AladinPriceSubInfoUserListUsed) _then;

  @override
  $Res call({
    Object? itemCount = freezed,
    Object? minPrice = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AladinPriceSubInfoUserListUsedCopyWith<$Res>
    implements $AladinPriceSubInfoUserListUsedCopyWith<$Res> {
  factory _$AladinPriceSubInfoUserListUsedCopyWith(
          _AladinPriceSubInfoUserListUsed value,
          $Res Function(_AladinPriceSubInfoUserListUsed) then) =
      __$AladinPriceSubInfoUserListUsedCopyWithImpl<$Res>;
  @override
  $Res call({int itemCount, int minPrice, String link});
}

/// @nodoc
class __$AladinPriceSubInfoUserListUsedCopyWithImpl<$Res>
    extends _$AladinPriceSubInfoUserListUsedCopyWithImpl<$Res>
    implements _$AladinPriceSubInfoUserListUsedCopyWith<$Res> {
  __$AladinPriceSubInfoUserListUsedCopyWithImpl(
      _AladinPriceSubInfoUserListUsed _value,
      $Res Function(_AladinPriceSubInfoUserListUsed) _then)
      : super(_value, (v) => _then(v as _AladinPriceSubInfoUserListUsed));

  @override
  _AladinPriceSubInfoUserListUsed get _value =>
      super._value as _AladinPriceSubInfoUserListUsed;

  @override
  $Res call({
    Object? itemCount = freezed,
    Object? minPrice = freezed,
    Object? link = freezed,
  }) {
    return _then(_AladinPriceSubInfoUserListUsed(
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AladinPriceSubInfoUserListUsed
    implements _AladinPriceSubInfoUserListUsed {
  const _$_AladinPriceSubInfoUserListUsed(
      {required this.itemCount, required this.minPrice, required this.link});

  factory _$_AladinPriceSubInfoUserListUsed.fromJson(
          Map<String, dynamic> json) =>
      _$$_AladinPriceSubInfoUserListUsedFromJson(json);

  @override
  final int itemCount;
  @override
  final int minPrice;
  @override
  final String link;

  @override
  String toString() {
    return 'AladinPriceSubInfoUserListUsed(itemCount: $itemCount, minPrice: $minPrice, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AladinPriceSubInfoUserListUsed &&
            const DeepCollectionEquality().equals(other.itemCount, itemCount) &&
            const DeepCollectionEquality().equals(other.minPrice, minPrice) &&
            const DeepCollectionEquality().equals(other.link, link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemCount),
      const DeepCollectionEquality().hash(minPrice),
      const DeepCollectionEquality().hash(link));

  @JsonKey(ignore: true)
  @override
  _$AladinPriceSubInfoUserListUsedCopyWith<_AladinPriceSubInfoUserListUsed>
      get copyWith => __$AladinPriceSubInfoUserListUsedCopyWithImpl<
          _AladinPriceSubInfoUserListUsed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AladinPriceSubInfoUserListUsedToJson(this);
  }
}

abstract class _AladinPriceSubInfoUserListUsed
    implements AladinPriceSubInfoUserListUsed {
  const factory _AladinPriceSubInfoUserListUsed(
      {required int itemCount,
      required int minPrice,
      required String link}) = _$_AladinPriceSubInfoUserListUsed;

  factory _AladinPriceSubInfoUserListUsed.fromJson(Map<String, dynamic> json) =
      _$_AladinPriceSubInfoUserListUsed.fromJson;

  @override
  int get itemCount;
  @override
  int get minPrice;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$AladinPriceSubInfoUserListUsedCopyWith<_AladinPriceSubInfoUserListUsed>
      get copyWith => throw _privateConstructorUsedError;
}
