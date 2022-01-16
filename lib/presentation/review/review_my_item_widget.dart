import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/service/core/app_date_time.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

SliverList reviewMyItemWidget({
  required Review me,
  required BuildContext context,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: darkThemeNavyCardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('nickName'),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: size.height * 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            await context
                                                .read<ReviewState>()
                                                .deleteMyReview(
                                                    review: me,
                                                    context: context);
                                          },
                                          title: Text(
                                            '리뷰 지우기',
                                            style: theme.textTheme.bodyText2!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Icon(Icons.more_horiz_rounded)),
                  ],
                ),
              ),
              _ratingForm(
                  title: '별점',
                  icon: Icons.star_rounded,
                  rating: me.starRating,
                  color: Colors.amber),
              const SizedBox(height: 8),
              _ratingForm(
                  title: '추천',
                  icon: Icons.favorite_rounded,
                  rating: me.favoriteRating,
                  color: Colors.pink,
                  size: 18,
                  leftPadding: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '"${me.contents}"',
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  appDateTime(dateTime: me.createdAt),
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(175, 175, 175, 1),
                      fontSize: 9),
                ),
              ),
            ],
          )),
    ),
  ]));
}

Padding _ratingForm({
  required String title,
  required IconData icon,
  required double rating,
  required Color color,
  double? size = 22.0,
  double? leftPadding = 0,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )),
        RatingBarIndicator(
          itemPadding: EdgeInsets.only(left: leftPadding!),
          rating: rating,
          itemBuilder: (context, index) => Icon(icon, color: color),
          itemSize: size!,
        ),
      ],
    ),
  );
}
