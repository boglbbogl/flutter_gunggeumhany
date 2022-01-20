import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/core/app_date_time.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Tab profileReviewWidget({
  required List<Review> review,
}) {
  return Tab(
    child: ListView(
      // shrinkWrap: true,
      children: [
        const SizedBox(height: 12),
        ...review.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: darkThemeNavyCardColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.bookTitle,
                              style: theme.textTheme.bodyText2!.copyWith(
                                  color: const Color.fromRGBO(195, 195, 195, 1),
                                  fontSize: 10),
                            ),
                            const SizedBox(height: 4),
                            Wrap(
                              children: [
                                ...e.bookAuthors.map((e) => Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                        e,
                                        style: theme.textTheme.bodyText2!
                                            .copyWith(
                                                color: const Color.fromRGBO(
                                                    195, 195, 195, 1),
                                                fontSize: 8),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: 0.3,
                          color: const Color.fromRGBO(115, 115, 115, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _ratingIndicator(
                                        color: Colors.amber,
                                        rating: e.starRating,
                                        icon: Icons.star_rounded,
                                        size: 20),
                                    const SizedBox(width: 22),
                                    _ratingIndicator(
                                        color: Colors.pink,
                                        rating: e.favoriteRating,
                                        icon: Icons.favorite_rounded,
                                        size: 18),
                                  ],
                                ),
                                Text(
                                  appDateTime(dateTime: e.updatedAt),
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: const Color.fromRGBO(
                                          195, 195, 195, 1),
                                      fontSize: 8),
                                )
                              ],
                            ),
                            if (e.contents.isNotEmpty) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 18),
                                child: Text(
                                  '"${e.contents}"',
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  )),
            ))
      ],
    ),
  );
}

Row _ratingIndicator({
  required double rating,
  required IconData icon,
  required double size,
  required Color color,
}) {
  return Row(
    children: [
      RatingBarIndicator(
        itemPadding: const EdgeInsets.only(left: 1),
        rating: rating,
        itemBuilder: (context, index) => Icon(icon, color: color),
        itemSize: size,
      ),
      const SizedBox(width: 8),
      Text(
        rating.toString(),
        style: theme.textTheme.bodyText2!
            .copyWith(color: color, fontSize: 8, fontWeight: FontWeight.bold),
      )
    ],
  );
}
