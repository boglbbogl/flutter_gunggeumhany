import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book_review_model.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/home/item_loading_shimmer_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeUserBookItem extends StatelessWidget {
  final List<BookReviewUser> reviewUserBook;
  final String title;
  final int listIndex;
  const HomeUserBookItem({
    Key? key,
    required this.reviewUserBook,
    required this.title,
    required this.listIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(
              height: size.width * 0.35,
              child: ListView.builder(
                  itemCount: reviewUserBook.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              context.read<ReviewState>().started();
                              await context
                                  .read<BookState>()
                                  .currentBookUpdateItem(
                                      docKey:
                                          reviewUserBook[index].book.docKey!,
                                      ISBN10:
                                          reviewUserBook[index].book.isbn10!,
                                      ISBN13:
                                          reviewUserBook[index].book.isbn13!,
                                      itemIndex: index,
                                      listIndex: listIndex);
                              pushNewScreen(context,
                                  screen: ReviewPage(
                                    aladinPrice:
                                        context.read<BookState>().aladinPrice,
                                    bookItem:
                                        context.read<BookState>().newBookItem,
                                  ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: reviewUserBook[index]
                                          .review
                                          .contents
                                          .isEmpty
                                      ? size.width * 0.25
                                      : size.width * 0.2,
                                  height: size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)),
                                      color: darkThemeBlackCardColor),
                                  child: reviewUserBook[index]
                                          .book
                                          .thumbnail
                                          .isEmpty
                                      ? Container()
                                      : ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8)),
                                          child: CachedNetworkImage(
                                            imageUrl: reviewUserBook[index]
                                                .book
                                                .thumbnail,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                color: appMainColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                if (reviewUserBook[index]
                                    .review
                                    .contents
                                    .isEmpty)
                                  Container(
                                    width: size.width * 0.18,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      color: darkThemeNavyCardColor,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _ratingForm(
                                              rate: reviewUserBook[index]
                                                  .review
                                                  .starRating
                                                  .toStringAsFixed(1),
                                              icon: Icons.star_rounded,
                                              color: Colors.amber,
                                              iconSize: 16,
                                              fontSize: 16),
                                          if (reviewUserBook[index]
                                                  .review
                                                  .favoriteRating !=
                                              0.0) ...[
                                            const SizedBox(height: 4),
                                            _ratingForm(
                                                rate: reviewUserBook[index]
                                                    .review
                                                    .favoriteRating
                                                    .toStringAsFixed(1),
                                                icon: Icons.favorite_rounded,
                                                color: Colors.pink,
                                                iconSize: 14,
                                                fontSize: 16),
                                          ],
                                        ],
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    width: size.width * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      color: darkThemeBlackCardColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            reviewUserBook[index]
                                                        .review
                                                        .contents
                                                        .length >
                                                    28
                                                ? '"${reviewUserBook[index].review.contents.substring(0, 28)} ..."'
                                                : '"${reviewUserBook[index].review.contents}"',
                                            maxLines: 3,
                                            style: theme.textTheme.bodyText2!
                                                .copyWith(fontSize: 12),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              _ratingForm(
                                                  rate: reviewUserBook[index]
                                                      .review
                                                      .starRating
                                                      .toString(),
                                                  icon: Icons.star_rounded,
                                                  color: Colors.amber,
                                                  iconSize: 12,
                                                  fontSize: 12),
                                              if (reviewUserBook[index]
                                                      .review
                                                      .favoriteRating !=
                                                  0.0) ...[
                                                const SizedBox(width: 12),
                                                _ratingForm(
                                                    rate: reviewUserBook[index]
                                                        .review
                                                        .favoriteRating
                                                        .toString(),
                                                    icon:
                                                        Icons.favorite_rounded,
                                                    color: Colors.pink,
                                                    iconSize: 10,
                                                    fontSize: 12),
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (context
                                .watch<BookState>()
                                .isCurrentBookItemLoading &&
                            index ==
                                context
                                    .watch<BookState>()
                                    .currentBookItemIndex &&
                            listIndex ==
                                context
                                    .watch<BookState>()
                                    .currentBookListIndex) ...[
                          itemLoadingShimmerWidget(
                              width:
                                  reviewUserBook[index].review.contents.isEmpty
                                      ? size.width * 0.432
                                      : size.width * 0.5,
                              height: size.width * 0.35)
                        ],
                        if (reviewUserBook[index]
                            .book
                            .bookmarkUserKey!
                            .contains(
                                context.watch<AuthState>().userProfile == null
                                    ? ""
                                    : context
                                        .watch<AuthState>()
                                        .userProfile!
                                        .userKey)) ...[
                          Positioned(
                            right: 2,
                            top: 2,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: darkThemeMainColor),
                              child: Icon(Icons.bookmark_added_rounded,
                                  size: 18, color: appMainColor),
                            ),
                          ),
                        ],
                      ],
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }

  Row _ratingForm({
    required String rate,
    required IconData icon,
    required Color color,
    required double iconSize,
    required double fontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          rate,
          style: theme.textTheme.bodyText2!.copyWith(
              color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
