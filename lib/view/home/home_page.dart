import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/main_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/home/home_appbar_widget.dart';
import 'package:flutter_gunggeumhany/view/home/home_book_item.dart';
import 'package:flutter_gunggeumhany/view/home/home_shimmer_widget.dart';
import 'package:flutter_gunggeumhany/view/home/home_user_book_item.dart';

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
                          listIndex: 1,
                          title: '베스트 셀러',
                          createdAt: provider.bestsellerCreatedAt,
                          book: provider.bestsellerList),
                      _mainBookForm(
                          listIndex: 2,
                          title: "궁금하니 추천",
                          createdAt: "",
                          book: provider.hanyRecommedBook),
                      if (context
                          .watch<AuthState>()
                          .userBookReview
                          .isNotEmpty) ...[
                        HomeUserBookItem(
                          listIndex: 100,
                          title: '내가 작성한 리뷰',
                          reviewUserBook:
                              context.watch<AuthState>().userBookReview,
                        ),
                      ],
                      _mainBookForm(
                          listIndex: 3,
                          title: '주목할 만한 신간',
                          createdAt: provider.specialNewBookCreatedAt,
                          book: provider.specialNewBookList),
                      _mainBookForm(
                          listIndex: 4,
                          title: '추천 리스트',
                          createdAt: provider.recommendBlogCreatedAt,
                          book: provider.recommendBlogList),
                      // 리뷰 많은순
                      _mainBookForm(
                          listIndex: 5,
                          title: '리뷰 많은 순',
                          createdAt: "",
                          book: provider.allManyReviewTopRankBook),
                      // 별점 높은순
                      _mainBookForm(
                          listIndex: 6,
                          title: '별점 높은 순',
                          createdAt: "",
                          book: provider.allStarRatingTopRankBook),
                      HomeUserBookItem(
                        listIndex: 101,
                        title: '최근에 작성된 리뷰',
                        reviewUserBook: provider.newestReviewAllBook,
                      ),
                      if (provider.bestsellerForeignList.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 7,
                            title: '베스트 셀러 (외국)',
                            createdAt: provider.bestsellerForeignCreatedAt,
                            book: provider.bestsellerForeignList),
                      ],
                      if (provider.editorFantasyBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 8,
                            title: '판타지',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorFantasyBook),
                      ],
                      if (provider.editorMysteryStory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 9,
                            title: '미스테리 소설',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorMysteryStory),
                      ],
                      if (provider.editorDramaStory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 10,
                            title: '드라마 소설',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorDramaStory),
                      ],
                      if (provider.editorTravelBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 11,
                            title: '여행',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorTravelBook),
                      ],
                      if (provider.editorSelfImprovement.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 12,
                            title: '자기계발',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorSelfImprovement),
                      ],
                      if (provider.editorHistoryBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 13,
                            title: '역사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorHistoryBook),
                      ],
                      if (provider.editorCollegeTextBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 14,
                            title: '전공/전문 서적',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorCollegeTextBook),
                      ],
                      if (provider.editorArtAndCulture.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 15,
                            title: '예술/대중문화',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorArtAndCulture),
                      ],
                      if (provider.editorEssay.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 16,
                            title: '에세이',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorEssay),
                      ],
                      if (provider.editorOldStory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 17,
                            title: '고전문학',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorOldStory),
                      ],
                      if (provider.editorForeignLanguage.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 18,
                            title: '외국어',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorForeignLanguage),
                      ],
                      if (provider.editorChildBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 19,
                            title: '어린이',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorChildBook),
                      ],
                      if (provider.editorCartoon.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 20,
                            title: '만화',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorCartoon),
                      ],
                      if (provider.editorComputerAndMobile.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 21,
                            title: '컴퓨터/모바일',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorComputerAndMobile),
                      ],
                      if (provider.editorMusicBook.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 22,
                            title: '음악',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorMusicBook),
                      ],
                      if (provider.editorSocialScience.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 23,
                            title: '사회 과학',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorSocialScience),
                      ],
                      if (provider.editorNationalDefense.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 24,
                            title: '국방',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorNationalDefense),
                      ],
                      if (provider.editorWarHistory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 25,
                            title: '전쟁사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorWarHistory),
                      ],
                      if (provider.editorGeography.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 26,
                            title: '지리학',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorGeography),
                      ],
                      if (provider.editorSFStory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 27,
                            title: 'SF',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorSFStory),
                      ],
                      if (provider.editorMovieStory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 28,
                            title: '영화 소설',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorMovieStory),
                      ],
                      if (provider.editorThemeHistory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 29,
                            title: '테마로 보는 역사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorThemeHistory),
                      ],
                      if (provider.editorEconomyHistory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 30,
                            title: '경제사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorEconomyHistory),
                      ],
                      if (provider.editorWorldPeopleHistory.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 31,
                            title: '세계 인물사',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorWorldPeopleHistory),
                      ],
                      if (provider.editorArchitecture.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 32,
                            title: '건축',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorArchitecture),
                      ],
                      if (provider.editorPicture.isNotEmpty) ...[
                        _mainBookForm(
                            listIndex: 33,
                            title: '사진',
                            createdAt: provider.recommendEditorCreatedAt,
                            book: provider.editorPicture),
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 4),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: const Icon(
                                              Icons.add_rounded,
                                              size: 28,
                                            )),
                                      ],
                                    ),
                                  ),
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
    required int listIndex,
  }) {
    return Column(
      children: [
        const SizedBox(height: 12),
        HomeBookItem(
          listIndex: listIndex,
          title: title,
          bookList: book.where((e) => e.thumbnail.isNotEmpty).toList(),
          createdAt: createdAt,
        ),
      ],
    );
  }
}
