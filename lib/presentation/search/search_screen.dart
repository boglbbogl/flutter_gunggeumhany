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
                          autofocus: true,
                          onFieldSubmitted: (value) {
                            context
                                .read<BookState>()
                                .getSearchBook(query: value);
                          },
                          style: theme.textTheme.bodyText2!
                              .copyWith(color: Colors.white, fontSize: 10),
                          decoration:
                              const InputDecoration(hintText: ' 검색어를 입력해 주세요'),
                        )),
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
                      context: context,
                      bookList: value.localBookList,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            context.read<BookState>().getKakaoSearchBook();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextStyle(
                                style: theme.textTheme.bodyText2!.copyWith(
                                    color:
                                        const Color.fromRGBO(195, 195, 195, 1),
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
                    context: context,
                    bookList: value.kakaoBookList,
                    widget: value.isKakaoEndPage
                        ? Container(
                            child: Text('is End'),
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
  }) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          ...bookList.map(
            (e) => Text(e.title),
          ),
          widget,
        ],
      ),
    );
  }
}
