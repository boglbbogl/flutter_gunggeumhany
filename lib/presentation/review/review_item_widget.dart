import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/blocked/blocked_list_widget.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/user_image.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/core/app_date_time.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:provider/provider.dart';

Consumer reviewItemWidget() {
  return Consumer<ReviewState>(
    builder: (context, value, child) => SliverList(
        delegate: SliverChildListDelegate([
      ...value.userReviewList
          .where((element) => !context
              .watch<AuthState>()
              .userActivity!
              .blockedReviewDocKey
              .contains(element.review.docKey))
          .map(
            (review) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: InkWell(
                onDoubleTap: () {},
                onLongPress: () {
                  blockedListWidget(
                    context: context,
                    blockedUserKey: review.userProfile.userKey,
                    bookDocKey: review.review.bookDocKey,
                    reviewDocKey: review.review.docKey,
                  );
                },
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
                              userImageAndName(
                                  context: context,
                                  userKey: review.userProfile.userKey,
                                  imageUrl: review.userProfile.imageUrl,
                                  nickName: review.userProfile.nickName),
                              Row(
                                children: [
                                  if (!review.review.favoriteRating.isNaN) ...[
                                    _reviewRatingForm(
                                        rating: review.review.favoriteRating
                                            .toString(),
                                        icon: Icons.favorite_rounded,
                                        color: Colors.pink,
                                        iconSize: 15),
                                  ],
                                  const SizedBox(width: 18),
                                  _reviewRatingForm(
                                      rating:
                                          review.review.starRating.toString(),
                                      icon: Icons.star_rounded,
                                      color: Colors.amber),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (review.review.contents.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('"${review.review.contents}"'),
                            ),
                          ],
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              appDateTime(dateTime: review.review.createdAt),
                              style: theme.textTheme.bodyText2!.copyWith(
                                  color: const Color.fromRGBO(175, 175, 175, 1),
                                  fontSize: 9),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
      const SizedBox(height: 30)
    ])),
  );
}

Row _reviewRatingForm({
  required String rating,
  required IconData icon,
  required Color color,
  double? iconSize = 18,
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
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}
