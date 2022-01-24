import 'package:freezed_annotation/freezed_annotation.dart';

part 'aladin_price.freezed.dart';
part 'aladin_price.g.dart';

@freezed
class AladinPrice with _$AladinPrice {
  const factory AladinPrice({
    required int priceStandard,
    required int priceSales,
    required AladinPriceSubInfo subInfo,
  }) = _AladinPrice;
  const AladinPrice._();
  factory AladinPrice.fromJson(Map<String, dynamic> json) =>
      _$AladinPriceFromJson(json);
  // factory AladinPrice.empty() => AladinPrice(
  //       priceStandard: priceStandard,
  //       priceSales: priceSales,
  //       subInfo: subInfo,
  //     );
}

@freezed
class AladinPriceSubInfo with _$AladinPriceSubInfo {
  const factory AladinPriceSubInfo({
    required List<AladinPriceSubInfoEbookList>? ebookList,
    required AladinPriceSubInfoUsedList? usedList,
  }) = _AladinPriceSubInfo;
  factory AladinPriceSubInfo.fromJson(Map<String, dynamic> json) =>
      _$AladinPriceSubInfoFromJson(json);
}

@freezed
class AladinPriceSubInfoEbookList with _$AladinPriceSubInfoEbookList {
  const factory AladinPriceSubInfoEbookList({
    required int priceSales,
    required String link,
  }) = _AladinPriceSubInfoEbookList;
  factory AladinPriceSubInfoEbookList.fromJson(Map<String, dynamic> json) =>
      _$AladinPriceSubInfoEbookListFromJson(json);
}

@freezed
class AladinPriceSubInfoUsedList with _$AladinPriceSubInfoUsedList {
  const factory AladinPriceSubInfoUsedList({
    required AladinPriceSubInfoUserListUsed? aladinUsed,
    required AladinPriceSubInfoUserListUsed? userUsed,
  }) = _AladinPriceSubInfoUsedList;
  factory AladinPriceSubInfoUsedList.fromJson(Map<String, dynamic> json) =>
      _$AladinPriceSubInfoUsedListFromJson(json);
}

@freezed
class AladinPriceSubInfoUserListUsed with _$AladinPriceSubInfoUserListUsed {
  const factory AladinPriceSubInfoUserListUsed({
    required int itemCount,
    required int minPrice,
    required String link,
  }) = _AladinPriceSubInfoUserListUsed;
  factory AladinPriceSubInfoUserListUsed.fromJson(Map<String, dynamic> json) =>
      _$AladinPriceSubInfoUserListUsedFromJson(json);
}
