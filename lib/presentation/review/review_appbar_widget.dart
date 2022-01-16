import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/model/book.dart';

SliverAppBar reviewAppbarWidget({
  required Book book,
}) {
  return SliverAppBar(
    floating: true,
    expandedHeight: size.height * 0.55,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        children: [
          CachedNetworkImage(
            width: size.width,
            height: size.height * 0.55,
            imageUrl: book.thumbnail,
            fit: BoxFit.fill,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                Text(
                  "${book.contents} ...",
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 25),
              ],
            )),
          ),
        ],
      ),
    ),
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
