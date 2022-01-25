import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/review/review_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

Tab profileBookmarkWidget({
  required List<Book> book,
  required BuildContext context,
}) {
  return Tab(
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: book.length > 9 ? 4 : 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 3),
        children: [
          ...book.map((e) => InkWell(
                onTap: () async {
                  context.read<ReviewState>().started();
                  await context
                      .read<BookState>()
                      .currentBookUpdateItem(docKey: e.docKey!);
                  pushNewScreen(context,
                      screen: ReviewPage(
                        bookItem: context.read<BookState>().newBookItem,
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: e.thumbnail,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 3),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: appMainColor,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}
