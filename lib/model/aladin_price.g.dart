// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aladin_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AladinPrice _$$_AladinPriceFromJson(Map<String, dynamic> json) =>
    _$_AladinPrice(
      priceStandard: json['priceStandard'] as int,
      priceSales: json['priceSales'] as int,
      subInfo:
          AladinPriceSubInfo.fromJson(json['subInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AladinPriceToJson(_$_AladinPrice instance) =>
    <String, dynamic>{
      'priceStandard': instance.priceStandard,
      'priceSales': instance.priceSales,
      'subInfo': instance.subInfo,
    };

_$_AladinPriceSubInfo _$$_AladinPriceSubInfoFromJson(
        Map<String, dynamic> json) =>
    _$_AladinPriceSubInfo(
      ebookList: (json['ebookList'] as List<dynamic>?)
          ?.map((e) =>
              AladinPriceSubInfoEbookList.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedList: json['usedList'] == null
          ? null
          : AladinPriceSubInfoUsedList.fromJson(
              json['usedList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AladinPriceSubInfoToJson(
        _$_AladinPriceSubInfo instance) =>
    <String, dynamic>{
      'ebookList': instance.ebookList,
      'usedList': instance.usedList,
    };

_$_AladinPriceSubInfoEbookList _$$_AladinPriceSubInfoEbookListFromJson(
        Map<String, dynamic> json) =>
    _$_AladinPriceSubInfoEbookList(
      priceSales: json['priceSales'] as int,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_AladinPriceSubInfoEbookListToJson(
        _$_AladinPriceSubInfoEbookList instance) =>
    <String, dynamic>{
      'priceSales': instance.priceSales,
      'link': instance.link,
    };

_$_AladinPriceSubInfoUsedList _$$_AladinPriceSubInfoUsedListFromJson(
        Map<String, dynamic> json) =>
    _$_AladinPriceSubInfoUsedList(
      aladinUsed: json['aladinUsed'] == null
          ? null
          : AladinPriceSubInfoUserListUsed.fromJson(
              json['aladinUsed'] as Map<String, dynamic>),
      userUsed: json['userUsed'] == null
          ? null
          : AladinPriceSubInfoUserListUsed.fromJson(
              json['userUsed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AladinPriceSubInfoUsedListToJson(
        _$_AladinPriceSubInfoUsedList instance) =>
    <String, dynamic>{
      'aladinUsed': instance.aladinUsed,
      'userUsed': instance.userUsed,
    };

_$_AladinPriceSubInfoUserListUsed _$$_AladinPriceSubInfoUserListUsedFromJson(
        Map<String, dynamic> json) =>
    _$_AladinPriceSubInfoUserListUsed(
      itemCount: json['itemCount'] as int,
      minPrice: json['minPrice'] as int,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_AladinPriceSubInfoUserListUsedToJson(
        _$_AladinPriceSubInfoUserListUsed instance) =>
    <String, dynamic>{
      'itemCount': instance.itemCount,
      'minPrice': instance.minPrice,
      'link': instance.link,
    };
