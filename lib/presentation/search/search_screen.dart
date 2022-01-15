import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/service/book_state.dart';
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
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_rounded)),
                    SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.04,
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            context
                                .read<BookState>()
                                .getSearchBook(query: value);
                            FocusScope.of(context).unfocus();
                          },
                          style: theme.textTheme.bodyText2!
                              .copyWith(color: Colors.white, fontSize: 10),
                          decoration:
                              const InputDecoration(hintText: ' 검색어를 입력해 주세요'),
                        )),
                    if (value.isLocalLoading) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: appMainColor,
                          ),
                        ),
                      )
                    ],
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  width: size.width,
                  height: 1,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                ),
                if (!value.isKakaoSearch) ...[
                  _bookListView(
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
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ...bookList.map(
              (e) => Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(51, 51, 51, 1),
                          border: Border.all(
                              color: const Color.fromRGBO(71, 71, 71, 1))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title.length > 40
                                  ? "${e.title.substring(0, 40)} ..."
                                  : e.title,
                              style: theme.textTheme.bodyText2!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 6),
                            _authorsAndTranslators(
                                list: e.authors, title: '지은이'),
                            _authorsAndTranslators(
                                list: e.translators, title: '옮긴이'),
                            const SizedBox(height: 2),
                            DefaultTextStyle(
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: const Color.fromRGBO(195, 195, 195, 1),
                                fontSize: 11,
                              ),
                              child: Row(
                                children: [
                                  Text(e.publisher),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 1,
                                      height: 8,
                                      color: const Color.fromRGBO(
                                          135, 135, 135, 1),
                                    ),
                                  ),
                                  Text(e.datetime.toString().substring(0, 10)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!isKakaoSearch) ...[
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("별점 ${e.reviewRating.toString()}"),
                          Text("리뷰 ${e.reviewUserKey!.length.toString()}개"),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }

  DefaultTextStyle _authorsAndTranslators({
    required List<String> list,
    required String title,
  }) {
    return DefaultTextStyle(
      style: theme.textTheme.bodyText2!.copyWith(
        color: const Color.fromRGBO(225, 225, 225, 1),
        fontSize: 12,
      ),
      child: Row(
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 1,
              height: 8,
              color: const Color.fromRGBO(135, 135, 135, 1),
            ),
          ),
          ...list.map((e) => Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      e,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
