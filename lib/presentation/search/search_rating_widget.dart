import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';

Positioned searchRatingWidget({
  required double favorite,
  required double star,
  required String reviewLength,
}) {
  return Positioned(
    bottom: 20,
    right: 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!favorite.isNaN) ...[
          _iconForm(
              rating: favorite.toString(),
              icon: Icons.favorite_rounded,
              color: Colors.pink,
              iconSize: 10),
        ],
        if (!star.isNaN) ...[
          _iconForm(
              rating: star.toString(),
              icon: Icons.star_rounded,
              color: Colors.amber),
        ],
        Text(
          "리뷰 $reviewLength개",
          style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(195, 195, 195, 1),
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Row _iconForm({
  required String rating,
  required IconData icon,
  double? iconSize = 12,
  required Color color,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: iconSize,
        color: color,
      ),
      const SizedBox(width: 4),
      Text(
        rating,
        style: theme.textTheme.bodyText2!
            .copyWith(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
