import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
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
                  context.read<ReviewState>()
                    ..started()
                    ..getUserReviewList(
                        userKey: context.read<AuthState>().userProfile!.userKey,
                        bookDocKey: e.docKey!,
                        ISBN10: e.isbn10!,
                        ISBN13: e.isbn13!);
                  pushNewScreen(context,
                      screen: ReviewPage(
                        bookItem: e,
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
