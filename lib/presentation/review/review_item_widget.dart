import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/service/core/app_date_time.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:provider/provider.dart';

Consumer reviewItemWidget() {
  return Consumer<ReviewState>(
    builder: (context, value, child) => SliverList(
        delegate: SliverChildListDelegate([
      ...value.reviewList.map((review) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(51, 51, 51, 1)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('nickName'),
                          Row(
                            children: [
                              if (!review.favoriteRating.isNaN) ...[
                                _reviewRatingForm(
                                    rating: review.favoriteRating.toString(),
                                    icon: Icons.favorite_rounded,
                                    color: Colors.pink,
                                    iconSize: 16),
                              ],
                              const SizedBox(width: 18),
                              _reviewRatingForm(
                                  rating: review.starRating.toString(),
                                  icon: Icons.star_rounded,
                                  color: Colors.amber),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('"${review.contents}"'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          appDateTime(dateTime: review.createdAt),
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(175, 175, 175, 1),
                              fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                )),
          )),
    ])),
  );
}

Row _reviewRatingForm({
  required String rating,
  required IconData icon,
  required Color color,
  double? iconSize = 20,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: iconSize,
        color: color,
      ),
      const SizedBox(width: 8),
      Text(
        rating,
        style: theme.textTheme.bodyText2!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}
