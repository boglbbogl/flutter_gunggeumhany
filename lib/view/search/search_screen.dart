import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/core/logger.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/review/review_page.dart';
import 'package:flutter_gunggeumhany/view/search/kakao_search_widget.dart';
import 'package:flutter_gunggeumhany/view/search/local_search_widget.dart';
import 'package:flutter_gunggeumhany/view/search/search_appbar_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookState>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                searchAppbarWidget(
                    context: context, isLocalLoading: value.isLocalLoading),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  width: size.width,
                  height: 1,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                ),
                if (!value.isKakaoSearch) ...[
                  _bookListView(
                      listIndex: 20,
                      isKakaoSearch: value.isKakaoSearch,
                      context: context,
                      bookList: value.localBookList,
                      widget: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            context.read<BookState>().getKakaoSearchBook();
                          },
                          child: value.isKakaoLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefaultTextStyle(
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              color: const Color.fromRGBO(
                                                  195, 195, 195, 1),
                                              fontSize: 11),
                                      child: const Text('원하는 검색 결과가 없으신가요 ?'),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.add_box_outlined,
                                      size: 18,
                                      color: Color.fromRGBO(195, 195, 195, 1),
                                    ),
                                  ],
                                ),
                        ),
                      ))
                ],
                if (value.isKakaoSearch) ...[
                  _bookListView(
                    listIndex: 21,
                    isKakaoSearch: value.isKakaoSearch,
                    context: context,
                    bookList: value.kakaoBookList,
                    widget: value.isKakaoEndPage
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 16,
                                  color: Color.fromRGBO(195, 195, 195, 1),
                                ),
                                const SizedBox(width: 8),
                                Text('더 이상 검색 결과가 없습니다...',
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: const Color.fromRGBO(
                                            195, 195, 195, 1),
                                        fontSize: 11)),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: value.isMoreLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: appMainColor,
                                    ),
                                  )
                                : IconButton(
                                    icon: const Icon(
                                        Icons.add_circle_outline_sharp,
                                        size: 28),
                                    onPressed: () {
                                      context
                                          .read<BookState>()
                                          .getMoreKakaoSearchBook();
                                    },
                                  ),
                          ),
                  )
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _bookListView({
    required List<Book> bookList,
    required BuildContext context,
    required Widget widget,
    required bool isKakaoSearch,
    required int listIndex,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ...List.generate(
              bookList.length,
              (index) => InkWell(
                onTap: () async {
                  context.read<ReviewState>().started();
                  if (bookList[index].docKey == null) {
                    await context
                        .read<BookState>()
                        .getNewBookWhereISBNItemNotDocKey(
                            isbn: bookList[index].isbn);
                  } else {
                    await context.read<BookState>().currentBookUpdateItem(
                        docKey: bookList[index].docKey!,
                        ISBN10: bookList[index].isbn10!,
                        ISBN13: bookList[index].isbn13!,
                        itemIndex: index,
                        listIndex: listIndex);
                  }
                  pushNewScreen(context,
                      screen: ReviewPage(
                        bookItem: context.read<BookState>().newBookItem,
                        aladinPrice: context.read<BookState>().aladinPrice,
                      ),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino);
                  logger.e(bookList[index].docKey);
                },
                child: Stack(
                  children: [
                    if (isKakaoSearch) ...[
                      kakaoSearchWidget(
                        book: bookList[index],
                      ),
                    ],
                    if (!isKakaoSearch) ...[
                      localSearchWidget(
                          itemIndex: index,
                          listIndex: listIndex,
                          context: context,
                          book: bookList[index],
                          isBookmark: context
                              .watch<AuthState>()
                              .userActivity!
                              .bookmarkBookDocKey
                              .contains(bookList[index].docKey)),
                    ],
                  ],
                ),
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
