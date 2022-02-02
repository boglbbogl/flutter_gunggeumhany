import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

Positioned bookRankingWidget({
  required int index,
}) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Container(
      width: 50,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: darkThemeMainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/numbers/one.png',
              fit: BoxFit.fill,
              color: Colors.white,
            ),
            Image.asset(
              'assets/images/numbers/two.png',
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}
