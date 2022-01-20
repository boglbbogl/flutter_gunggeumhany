import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_book_item.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_shimmer_widget.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_user_book_item.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/main_state.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<MainState>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: homeAppbarWidget(context: context),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: provider.bestsellerList.isEmpty
                ? homeShimmerWidget()
                : ListView(
                    shrinkWrap: true,
                    children: [
                      _mainBookForm(
                          title: '베스트 셀러',
                          createdAt: provider.bestsellerCreatedAt,
                          book: provider.bestsellerList),
                      _mainBookForm(
                          title: "궁금하니 추천",
                          createdAt: "",
                          book: provider.hanyRecommedBook),
                      if (context
                          .watch<AuthState>()
                          .userBookReview
                          .isNotEmpty) ...[
                        const HomeUserBookItem(),
                      ],
                      _mainBookForm(
                          title: '주목할 만한 신간',
                          createdAt: provider.specialNewBookCreatedAt,
                          book: provider.specialNewBookList),
                      _mainBookForm(
                          title: '추천 리스트',
                          createdAt: provider.recommendBlogCreatedAt,
                          book: provider.recommendBlogList),
                      if (provider.bestsellerForeignList.isNotEmpty) ...[
                        _mainBookForm(
                            title: '베스트 셀러 (외국)',
                            createdAt: provider.bestsellerForeignCreatedAt,
                            book: provider.bestsellerForeignList),
                      ],
                      if (provider.editorFantasyBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '판타지',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorFantasyBook),
                      ],
                      if (provider.editorMysteryStory.isNotEmpty) ...[
                        _mainBookForm(
                            title: '미스테리 소설',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorMysteryStory),
                      ],
                      if (provider.editorDramaStory.isNotEmpty) ...[
                        _mainBookForm(
                            title: '드라마 소설',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorDramaStory),
                      ],
                      if (provider.editorTravelBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '여행',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorTravelBook),
                      ],
                      if (provider.editorSelfImprovement.isNotEmpty) ...[
                        _mainBookForm(
                            title: '자기계발',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorSelfImprovement),
                      ],
                      if (provider.editorHistoryBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '역사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorHistoryBook),
                      ],
                      if (provider.editorCollegeTextBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '전공/전문 서적',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorCollegeTextBook),
                      ],
                      if (provider.editorArtAndCulture.isNotEmpty) ...[
                        _mainBookForm(
                            title: '예술/대중문화',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorArtAndCulture),
                      ],
                      if (provider.editorEssay.isNotEmpty) ...[
                        _mainBookForm(
                            title: '에세이',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorEssay),
                      ],
                      if (provider.editorOldStory.isNotEmpty) ...[
                        _mainBookForm(
                            title: '고전문학',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorOldStory),
                      ],
                      if (provider.editorForeignLanguage.isNotEmpty) ...[
                        _mainBookForm(
                            title: '외국어',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorForeignLanguage),
                      ],
                      if (provider.editorChildBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '어린이',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorChildBook),
                      ],
                      if (provider.editorCartoon.isNotEmpty) ...[
                        _mainBookForm(
                            title: '만화',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorCartoon),
                      ],
                      if (provider.editorComputerAndMobile.isNotEmpty) ...[
                        _mainBookForm(
                            title: '컴퓨터/모바일',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorComputerAndMobile),
                      ],
                      if (provider.editorMusicBook.isNotEmpty) ...[
                        _mainBookForm(
                            title: '음악',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorMusicBook),
                      ],
                      const SizedBox(height: 20),
                      if (provider.bestsellerList.isNotEmpty &&
                          provider.moreBookItemIndex != 5) ...[
                        Shimmer.fromColors(
                          baseColor: const Color.fromRGBO(155, 155, 155, 1),
                          highlightColor:
                              const Color.fromRGBO(215, 215, 215, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: provider.isBookMoreLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : InkWell(
                                    onTap: () {
                                      if (provider.moreBookItemIndex == 0) {
                                        provider.categoryMoreBookFirstItem();
                                      } else if (provider.moreBookItemIndex ==
                                          1) {
                                        provider.categoryMoreBookSecondItem();
                                      } else if (provider.moreBookItemIndex ==
                                          2) {
                                        provider.categoryMoreBookThirdItem();
                                      } else if (provider.moreBookItemIndex ==
                                          3) {
                                        provider.categoryMoreBookForthItem();
                                      } else if (provider.moreBookItemIndex ==
                                          4) {
                                        provider.categoryMoreBookFifthItem();
                                      } else {}
                                    },
                                    child: const Icon(
                                      Icons.add_circle_outline_rounded,
                                      size: 36,
                                    )),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
          ),
        );
      },
    );
  }

  Column _mainBookForm({
    required String title,
    required String createdAt,
    required List<Book> book,
  }) {
    return Column(
      children: [
        const SizedBox(height: 12),
        HomeBookItem(
          title: title,
          bookList: book.where((e) => e.thumbnail.isNotEmpty).toList(),
          createdAt: createdAt,
        ),
      ],
    );
  }
}
