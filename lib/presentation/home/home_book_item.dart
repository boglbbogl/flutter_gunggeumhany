import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeBookItem extends StatelessWidget {
  final String title;
  final List<Book> bookList;
  final String createdAt;
  const HomeBookItem({
    Key? key,
    required this.title,
    required this.bookList,
    required this.createdAt,
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              ...bookList.map((book) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<ReviewState>()
                              ..started()
                              ..getUserReviewList(
                                userKey: context
                                    .read<AuthState>()
                                    .userProfile!
                                    .userKey,
                                bookDocKey: book.docKey!,
                                ISBN10: book.isbn10!,
                                ISBN13: book.isbn13!,
                              );
                            pushNewScreen(context,
                                screen: ReviewPage(
                                  bookItem: book,
                                ));
                          },
                          child: Container(
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: darkThemeNavyCardColor),
                            child: book.thumbnail.isEmpty
                                ? Container()
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: book.thumbnail,
                                      fit: BoxFit.cover,
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
                      if (book.bookmarkUserKey!.contains(
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
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
