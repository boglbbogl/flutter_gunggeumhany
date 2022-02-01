import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:flutter_gunggeumhany/state/preference_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

Padding preferenceBookWidget({
  required Book book,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: darkThemeNavyCardColor),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            height: size.width * 0.25,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: CachedNetworkImage(
                  imageUrl: book.thumbnail,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: appMainColor,
                        ),
                      )),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: size.width * 0.7,
            height: size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    if (book.isbn13 != "") ...[
                      const SizedBox(height: 2),
                      Text(
                        "ISBN 13 - ${book.isbn13}",
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 8,
                        ),
                      ),
                    ],
                    if (book.categoryList!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          ...book.categoryList!.map((e) => Text(
                                e,
                                style: theme.textTheme.bodyText2!.copyWith(
                                  color: const Color.fromRGBO(195, 195, 195, 1),
                                  fontSize: 8,
                                ),
                              ))
                        ],
                      )
                    ],
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '별점',
                        style: theme.textTheme.bodyText2!.copyWith(
                            color: Colors.amber,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      RatingBar(
                        itemSize: 16,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_half_rounded,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_border_rounded,
                              color: Colors.amber,
                            )),
                        onRatingUpdate: (value) {
                          context.read<PreferenceState>().starRatingCreateItem(
                                  preferenceModel: PreferenceModel(
                                isbn13: book.isbn13 == null ? "" : book.isbn13!,
                                isbn10: book.isbn10 == null ? "" : book.isbn10!,
                                title: book.title,
                                category: book.categoryList!.isEmpty
                                    ? []
                                    : book.categoryList!,
                                starRating: value,
                              ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
