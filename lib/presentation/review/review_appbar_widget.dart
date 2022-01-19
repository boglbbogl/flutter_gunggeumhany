import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/intl_format.dart';
import 'package:flutter_gunggeumhany/service/activity_state.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:provider/provider.dart';

SliverAppBar reviewAppbarWidget({
  required Book book,
  required BuildContext context,
}) {
  return SliverAppBar(
    floating: true,
    expandedHeight: size.height * 0.6,
    centerTitle: false,
    title: Text(
      "리뷰 ${book.starUserKey!.length.toString()} 개",
      style: theme.textTheme.bodyText2!.copyWith(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      if (book.starUserKey!.isNotEmpty) ...[
        if (book.starUserKey!.isNotEmpty && book.favoriteUserKey!.isEmpty)
          _ratingForm(
              rate: (book.starRating! / book.starUserKey!.length).toString(),
              icon: Icons.star_rounded,
              color: Colors.amber)
        else
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ratingForm(
                  rate:
                      (book.starRating! / book.starUserKey!.length).toString(),
                  icon: Icons.star_rounded,
                  color: Colors.amber),
              _ratingForm(
                  rate: (book.favoriteRating! / book.favoriteUserKey!.length)
                      .toString(),
                  icon: Icons.favorite_rounded,
                  color: Colors.pink),
            ],
          ),
      ],
      const SizedBox(width: 12),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: context
                .watch<AuthState>()
                .userActivity!
                .bookmarkBookDocKey
                .contains(book.docKey)
            ? IconButton(
                key: const ValueKey('value'),
                onPressed: () async {
                  await context.read<ActivityState>().removeBookmark(
                      userKey: context.read<AuthState>().userProfile!.userKey,
                      bookDocKey: book.docKey!);
                  await context.read<AuthState>().getMyActivity(
                      userKey: context.read<AuthState>().userProfile!.userKey);
                },
                icon: Icon(
                  Icons.bookmark_added,
                  size: 28,
                  color: appMainColor,
                ))
            : IconButton(
                onPressed: () async {
                  await context.read<ActivityState>().addBookmark(
                      userKey: context.read<AuthState>().userProfile!.userKey,
                      bookDocKey: book.docKey!);
                  await context.read<AuthState>().getMyActivity(
                        userKey: context.read<AuthState>().userProfile!.userKey,
                      );
                },
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  size: 28,
                  color: Colors.white,
                )),
      ),
      const SizedBox(width: 8),
    ],
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        children: [
          if (book.thumbnail.isEmpty)
            Container(
              height: size.height * 0.6,
              color: Colors.deepPurple.shade100,
            )
          else
            CachedNetworkImage(
              width: size.width,
              height: size.height * 0.6,
              imageUrl: book.thumbnail,
              fit: BoxFit.fill,
            ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: size.width,
              height: size.height * 0.63,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (book.thumbnail.isEmpty)
                  Container(
                    width: size.width * 0.4,
                    height: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.shade100,
                    ),
                  )
                else
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      width: size.width * 0.4,
                      height: size.width * 0.5,
                      imageUrl: book.thumbnail,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 70),
                        child: CircularProgressIndicator(
                          color: appMainColor,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 18),
                Text(
                  book.title,
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (book.authors.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _authorsAndTranslatorsForm(item: book.authors),
                ],
                if (book.translators.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _authorsAndTranslatorsForm(item: book.translators),
                ],
                const SizedBox(height: 6),
                DefaultTextStyle(
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        book.publisher,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 0.5,
                          height: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${koFormatMoney.format(book.price)} 원",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 0.5,
                          height: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(book.datetime.toString().substring(0, 10)),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "ISBN - ${book.isbn}",
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 6),
                if(book.contents.isNotEmpty)...[
  Text(
                  "${book.contents} ...",
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 9,
                  ),
                ),
                ],
              
                const SizedBox(height: 35),
              ],
            )),
          ),
        ],
      ),
    ),
  );
}

Row _ratingForm({
  required String rate,
  required IconData icon,
  required Color color,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 12,
        color: color,
      ),
      const SizedBox(width: 4),
      Text(
        rate,
        style: theme.textTheme.bodyText2!.copyWith(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

Row _authorsAndTranslatorsForm({
  required List<String> item,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...item.map((e) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              e,
              style: theme.textTheme.bodyText2!.copyWith(
                fontSize: 12,
              ),
            ),
          )),
    ],
  );
}
