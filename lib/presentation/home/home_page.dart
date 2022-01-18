import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_book_item.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_shimmer_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/aladin_state.dart';
import 'package:flutter_gunggeumhany/service/main_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
            duration: const Duration(milliseconds: 700),
            child: provider.bestsellerList.isEmpty ||
                    provider.specialNewBookList.isEmpty
                ? homeShimmerWidget()
                : ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 12),
                      HomeBookItem(
                        title: '베스트 셀러',
                        bookList: provider.bestsellerList
                            .where((e) => e.thumbnail.isNotEmpty)
                            .toList(),
                        createdAt: provider.bestsellerCreatedAt,
                      ),
                      const SizedBox(height: 12),
                      HomeBookItem(
                        title: '주목할 만한 신간',
                        bookList: provider.specialNewBookList
                            .where((e) => e.thumbnail.isNotEmpty)
                            .toList(),
                        createdAt: provider.specialNewBookCreatedAt,
                      ),
                      const SizedBox(height: 12),
                      HomeBookItem(
                        title: '추천 리스트',
                        bookList: provider.recommendBlogList
                            .where((e) => e.thumbnail.isNotEmpty)
                            .toList(),
                        createdAt: provider.recommendBlogCreatedAt,
                      ),
                      const SizedBox(height: 12),
                      HomeBookItem(
                        title: '베스트 셀러 (외국)',
                        bookList: provider.bestsellerForeignList
                            .where((e) => e.thumbnail.isNotEmpty)
                            .toList(),
                        createdAt: provider.bestsellerForeignCreatedAt,
                      ),
                      const SizedBox(height: 12),
                      HomeBookItem(
                        title: '신간',
                        bookList: provider.newBookList
                            .where((e) => e.thumbnail.isNotEmpty)
                            .toList(),
                        createdAt: provider.newBookCreatedAt,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
