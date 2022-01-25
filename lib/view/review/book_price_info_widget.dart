import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/intl_format.dart';

SliverList bookPriceInfoWidget({
  required AladinPrice aladinPrice,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: darkThemeBlackCardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '지금 여기서 구매',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appMainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 6),
              _aladinPriceForm(
                  title: '알라딘',
                  price: aladinPrice.priceStandard,
                  salesPrice: aladinPrice.priceSales),
              if (aladinPrice.subInfo.usedList != null) ...[
                if (aladinPrice.subInfo.usedList!.aladinUsed != null) ...[
                  if (aladinPrice.subInfo.usedList!.aladinUsed!.minPrice !=
                      0) ...[
                    _aladinPriceForm(
                        title: '중고 (알라딘)',
                        price:
                            aladinPrice.subInfo.usedList!.aladinUsed!.minPrice,
                        count: aladinPrice
                            .subInfo.usedList!.aladinUsed!.itemCount),
                  ],
                ],
                if (aladinPrice.subInfo.usedList!.userUsed != null) ...[
                  if (aladinPrice.subInfo.usedList!.userUsed!.minPrice !=
                      0) ...[
                    _aladinPriceForm(
                        title: '중고 (사용자)',
                        price: aladinPrice.subInfo.usedList!.userUsed!.minPrice,
                        count:
                            aladinPrice.subInfo.usedList!.userUsed!.itemCount),
                  ],
                ],
              ],
              if (aladinPrice.subInfo.ebookList != null) ...[
                if (aladinPrice.subInfo.ebookList!.isNotEmpty) ...[
                  ...aladinPrice.subInfo.ebookList!.map(
                    (e) =>
                        _aladinPriceForm(title: 'e-Book', price: e.priceSales),
                  )
                ],
              ],
            ],
          ),
        ),
      ),
    )
  ]));
}

Padding _aladinPriceForm({
  required String title,
  required int price,
  int? salesPrice,
  int? count,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(31, 31, 31, 1)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/aladin_logo.png',
                      width: 25,
                      height: 25,
                      scale: 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(title,
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                ],
              ),
              if (salesPrice == null)
                Row(
                  children: [
                    Text(
                      count == null ? "" : "${count.toString()} 권",
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(175, 175, 175, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      koFormatMoney.format(price),
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              else
                Column(
                  children: [
                    Text(
                      koFormatMoney.format(price),
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(175, 175, 175, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: Colors.pink),
                    ),
                    Text(
                      koFormatMoney.format(salesPrice),
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    ),
  );
}
