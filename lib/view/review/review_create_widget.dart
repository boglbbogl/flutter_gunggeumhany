import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

SliverList reviewCreateWidget({
  required BuildContext context,
  required String bookDocKey,
  required String bookTitle,
  required List<String> authors,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Container(
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
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              _ratingBarForm(
                  isHalf: true,
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
                  isHalf: false,
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
                    decoration:
                        const InputDecoration(hintText: '20자 이상 작성해 주세요'),
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
                    onTap: () async {
                      if (context.read<ReviewState>().starRating == 0.0) {
                        appFlushbar(message: '책에 대한 별점은 필수 입력사항 입니다')
                            .show(context);
                      } else {
                        final _isSuccess =
                            await context.read<ReviewState>().createReview(
                                  context: context,
                                  bookDocKey: bookDocKey,
                                  bookTitle: bookTitle,
                                  authors: authors,
                                  userKey: context
                                      .read<AuthState>()
                                      .userProfile!
                                      .userKey,
                                );
                        if (_isSuccess) {
                          await context.read<BookState>().currentBookUpdateItem(
                                docKey: bookDocKey,
                                ISBN10: "",
                                ISBN13: "",
                              );
                          await context.read<ReviewState>().getMyReviewList(
                              bookDocKey: bookDocKey,
                              userKey: context
                                  .read<AuthState>()
                                  .userProfile!
                                  .userKey);
                          await context
                              .read<AuthState>()
                              .getMainFeedUserReviewListUpdate(
                                userKey: context
                                    .read<AuthState>()
                                    .userProfile!
                                    .userKey,
                              );
                        }
                      }
                    },
                    child: context.watch<ReviewState>().isCreateReview
                        ? Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                                width: 32,
                                height: 32,
                                child: CircularProgressIndicator(
                                  color: appMainColor,
                                )),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:
                                  context.watch<ReviewState>().starRating == 0.0
                                      ? const Color.fromRGBO(91, 91, 91, 1)
                                      : appMainColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 14),
                              child: Text('리뷰 남기기',
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
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
    ),
    const SizedBox(height: 20),
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
  required bool isHalf,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: color,
            )),
        RatingBar(
          itemSize: size,
          itemPadding: EdgeInsets.only(left: leftPadding!),
          allowHalfRating: isHalf,
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
