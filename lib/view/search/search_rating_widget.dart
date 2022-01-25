import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

Column searchRatingWidget({
  required double favorite,
  required double star,
  required int reviewLength,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!star.isNaN) ...[
            _iconForm(
                rating: star.toStringAsFixed(1),
                icon: Icons.star_rounded,
                color: Colors.amber),
          ],
          const SizedBox(width: 8),
          if (!favorite.isNaN) ...[
            _iconForm(
                rating: favorite.toStringAsFixed(1),
                icon: Icons.favorite_rounded,
                color: Colors.pink,
                iconSize: 8),
          ],
        ],
      ),
      const SizedBox(width: 4),
      if (reviewLength != 0) ...[
        Text(
          "리뷰 $reviewLength개",
          style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(195, 195, 195, 1),
              fontSize: 8,
              fontWeight: FontWeight.bold),
        ),
      ],
    ],
  );
}

Row _iconForm({
  required String rating,
  required IconData icon,
  double? iconSize = 10,
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
            .copyWith(color: color, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
