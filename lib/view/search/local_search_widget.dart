import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/search/search_rating_widget.dart';
import 'package:flutter_gunggeumhany/view/search/search_shimmer_loading_widget.dart';
import 'package:provider/provider.dart';

Stack localSearchWidget({
  required Book book,
  required bool isBookmark,
  required int itemIndex,
  required int listIndex,
  required BuildContext context,
}) {
  final List<String> _authors =
      book.authors.length > 3 ? book.authors.sublist(0, 3) : book.authors;
  return Stack(
    children: [
      Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromRGBO(51, 51, 51, 1)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: size.width * 0.15,
                        height: size.width * 0.2,
                        child: book.thumbnail.isEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                    color: Color.fromRGBO(91, 91, 91, 1)),
                                width: size.width * 0.15,
                                height: size.width * 0.2,
                              )
                            : ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: book.thumbnail,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: appMainColor,
                                    ),
                                  ),
                                ),
                              )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title.length > 27
                                  ? "${book.title.replaceAll(".", " ").substring(0, 27)} ..."
                                  : book.title.replaceAll(".", " "),
                              style: theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                ..._authors.map((e) => Wrap(
                                      children: [
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(e,
                                                style: theme
                                                    .textTheme.bodyText2!
                                                    .copyWith(
                                                        color: const Color
                                                                .fromRGBO(
                                                            175, 175, 175, 1),
                                                        fontSize: 9))),
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(height: 6),
                            searchRatingWidget(
                              favorite: book.favoriteRating! /
                                  book.favoriteUserKey!.length,
                              star: book.starRating! / book.starUserKey!.length,
                              reviewLength: book.starUserKey!.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      if (context.watch<BookState>().isCurrentBookItemLoading &&
          context.watch<BookState>().currentBookItemIndex == itemIndex &&
          context.watch<BookState>().currentBookListIndex == listIndex) ...[
        searchShimmerLoadingWidget(width: size.width, height: size.width * 0.2),
      ],
      if (isBookmark) ...[
        Positioned(
          right: 2,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Icon(
              Icons.bookmark_added,
              size: 25,
              color: appMainColor,
            ),
          ),
        )
      ],
    ],
  );
}
