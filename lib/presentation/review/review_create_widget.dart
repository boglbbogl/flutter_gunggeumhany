import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

SliverList reviewCreateWidget({
  required BuildContext context,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: darkThemeNavyCardColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                '리뷰를 남겨주세요',
                style: theme.textTheme.bodyText2!.copyWith(
                    color: appMainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            _ratingBarForm(
                title: "별점",
                size: 28,
                color: Colors.amber,
                full: Icons.star_rounded,
                half: Icons.star_half_rounded,
                empty: Icons.star_border_rounded,
                onRatingUpdate: (value) {
                  context.read<ReviewState>().changedStarRating(value: value);
                }),
            const SizedBox(height: 8),
            _ratingBarForm(
                leftPadding: 6,
                title: "추천",
                size: 23,
                color: Colors.pink,
                full: Icons.favorite_rounded,
                half: Icons.favorite,
                empty: Icons.favorite_border_rounded,
                onRatingUpdate: (value) {
                  context
                      .read<ReviewState>()
                      .changedFavoriteRating(value: value);
                }),
            const SizedBox(height: 8),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: darkThemeMainColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<ReviewState>()
                        .changedReviewContents(value: value);
                  },
                  maxLines: 8,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: Colors.white, fontSize: 12),
                  decoration: const InputDecoration(hintText: '20자 이상 작성해 주세요'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      _ratingResultForm(
                          icon: Icons.star_rounded,
                          size: 14,
                          color: Colors.amber,
                          rate: context
                              .watch<ReviewState>()
                              .starRating
                              .toString()),
                      const SizedBox(
                        width: 12,
                      ),
                      if (context.watch<ReviewState>().favoriteRating !=
                          0.0) ...[
                        _ratingResultForm(
                            icon: Icons.favorite_rounded,
                            size: 12,
                            color: Colors.pink,
                            rate: context
                                .watch<ReviewState>()
                                .favoriteRating
                                .ceil()
                                .toString()),
                      ],
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.watch<ReviewState>().starRating == 0.0
                          ? const Color.fromRGBO(91, 91, 91, 1)
                          : appMainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 14),
                      child: Text('리뷰 남기기',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
    const SizedBox(height: 20),
    Container(width: 100, height: 100, color: Colors.amber),
  ]));
}

Row _ratingResultForm({
  required IconData icon,
  required String rate,
  required double size,
  required Color color,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: size,
        color: color,
      ),
      const SizedBox(width: 8),
      Text(
        rate,
        style: theme.textTheme.bodyText2!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Padding _ratingBarForm({
  required String title,
  required Color color,
  required IconData full,
  required IconData half,
  required IconData empty,
  required double size,
  required Function(double) onRatingUpdate,
  double? leftPadding = 0,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: color,
            )),
        RatingBar(
          itemSize: size,
          itemPadding: EdgeInsets.only(left: leftPadding!),
          allowHalfRating: true,
          ratingWidget: RatingWidget(
              full: Icon(
                full,
                color: color,
              ),
              half: Icon(
                half,
                color: color,
              ),
              empty: Icon(
                empty,
                color: color,
              )),
          onRatingUpdate: onRatingUpdate,
        ),
      ],
    ),
  );
}