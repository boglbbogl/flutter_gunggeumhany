import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/home/book_ranking_widget.dart';
import 'package:flutter_gunggeumhany/view/home/item_loading_shimmer_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_page.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeBookItem extends StatelessWidget {
  final String title;
  final List<Book> bookList;
  final String createdAt;
  final int listIndex;
  const HomeBookItem({
    Key? key,
    required this.title,
    required this.bookList,
    required this.createdAt,
    required this.listIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 18),
                if (createdAt.isNotEmpty) ...[
                  Text(
                    createdAt,
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(155, 155, 155, 1),
                      fontSize: 10,
                    ),
                  ),
                ],
              ],
            )),
        SizedBox(
          height: size.width * 0.4,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          context.read<ReviewState>().started();
                          await context.read<BookState>().currentBookUpdateItem(
                              docKey: bookList[index].docKey!,
                              ISBN10: bookList[index].isbn10!,
                              ISBN13: bookList[index].isbn13!,
                              itemIndex: index,
                              listIndex: listIndex);
                          pushNewScreen(context,
                              screen: ReviewPage(
                                aladinPrice:
                                    context.read<BookState>().aladinPrice,
                                bookItem: context.read<BookState>().newBookItem,
                              ));
                        },
                        child: Container(
                          width: size.width * 0.25,
                          height: size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: darkThemeBlackCardColor),
                          child: bookList[index].thumbnail.isEmpty
                              ? Container()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: bookList[index].thumbnail,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: appMainColor,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    if (context.watch<BookState>().isCurrentBookItemLoading &&
                        index ==
                            context.watch<BookState>().currentBookItemIndex &&
                        listIndex ==
                            context
                                .watch<BookState>()
                                .currentBookListIndex) ...[
                      itemLoadingShimmerWidget(
                          width: size.width * 0.25, height: size.width * 0.4),
                    ],
                    if (listIndex == 1) ...[
                      bookRankingWidget(index: index),
                    ],
                    if (bookList[index].bookmarkUserKey!.contains(
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
    );
  }
}
