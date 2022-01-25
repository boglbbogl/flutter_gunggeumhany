import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/review/review_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

Tab profileBookmarkWidget({
  required List<Book> book,
  required BuildContext context,
}) {
  return Tab(
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
          itemCount: book.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: book.length > 9 ? 4 : 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                context.read<ReviewState>().started();
                await context.read<BookState>().currentBookUpdateItem(
                      docKey: book[index].docKey!,
                      ISBN10: book[index].isbn10!,
                      ISBN13: book[index].isbn13!,
                      itemIndex: index,
                      listIndex: 30,
                    );
                pushNewScreen(context,
                    screen: ReviewPage(
                      aladinPrice: context.read<BookState>().aladinPrice,
                      bookItem: context.read<BookState>().newBookItem,
                    ));
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: book[index].thumbnail,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 3),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: appMainColor,
                        ),
                      ),
                    ),
                  ),
                  if (context.watch<BookState>().isCurrentBookItemLoading &&
                      context.watch<BookState>().currentBookItemIndex ==
                          index &&
                      context.watch<BookState>().currentBookListIndex ==
                          30) ...[
                    Shimmer.fromColors(
                      baseColor: Colors.black87,
                      highlightColor: Colors.white38,
                      period: const Duration(milliseconds: 1000),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                      ),
                    )
                  ],
                ],
              ),
            );
          }),
    ),
  );
}
