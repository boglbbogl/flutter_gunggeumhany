import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';

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
            color: darkThemeBlackCardColor),
        child: Column(
          children: [
            Row(
              children: [
                Text('알라딘'),
                Column(
                  children: [
                    Text(aladinPrice.priceSales.toString()),
                    Text(aladinPrice.priceStandard.toString())
                  ],
                )
              ],
            ),
            if (aladinPrice.subInfo.usedList != null) ...[
              if (aladinPrice.subInfo.usedList!.aladinUsed != null) ...[
                Row(
                  children: [
                    Text('알라딘 중고'),
                    Column(
                      children: [
                        Text(aladinPrice.subInfo.usedList!.aladinUsed!.minPrice
                            .toString()),
                      ],
                    )
                  ],
                ),
              ],
              if (aladinPrice.subInfo.usedList!.userUsed != null) ...[
                Row(
                  children: [
                    Text('알라딘 사용자 중고'),
                    Column(
                      children: [
                        Text(aladinPrice.subInfo.usedList!.userUsed!.minPrice
                            .toString()),
                      ],
                    )
                  ],
                ),
              ],
            ],
            if (aladinPrice.subInfo.ebookList != null) ...[
              Row(
                children: [
                  Text('알라딘 e-book'),
                  Column(
                    children: [
                      Text(
                          aladinPrice.subInfo.ebookList!.priceSales.toString()),
                    ],
                  )
                ],
              ),
            ],
          ],
        ),
      ),
    )
  ]));
}
