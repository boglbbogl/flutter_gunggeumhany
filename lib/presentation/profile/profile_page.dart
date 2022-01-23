import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_indicator.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_bookmark_widget.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_review_widget.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_user_widget.dart';
import 'package:flutter_gunggeumhany/presentation/setting/setting_drawer_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final bool isMe;
  final String userKey;

  const ProfilePage({
    Key? key,
    required this.isMe,
    required this.userKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context
            .watch<ProfileState>()
            .profileModelList
            .where((element) => element.userProfile.userKey.contains(userKey))
            .isEmpty ||
        context.watch<AuthState>().userProfile == null ||
        context.watch<AuthState>().userActivity == null) {
      return appIndicator();
    }
    return GestureDetector(
      onTap: () =>
          context.read<ProfileState>().openAndCloseDrawer(value: false),
      child: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(
                  context.watch<ProfileState>().isDrawer
                      ? -size.width * 0.5
                      : 0,
                  0,
                  0),
              child: Scaffold(
                appBar: profileAppbarWidget(
                    context: context,
                    isMe: isMe,
                    isFollowers: context
                        .watch<AuthState>()
                        .userActivity!
                        .followerUserKey
                        .contains(userKey),
                    userNickName: context
                        .watch<ProfileState>()
                        .profileModelList
                        .where((element) =>
                            element.userProfile.userKey.contains(userKey))
                        .map((e) => e.userProfile.nickName)
                        .firstOrNull!),
                body: NestedScrollView(
                    headerSliverBuilder: (context, value) {
                      return [
                        ProfileUserWidget(
                          userKey: userKey,
                          isMyFeed: context
                              .watch<AuthState>()
                              .userProfile!
                              .userKey
                              .contains(userKey),
                        ),
                      ];
                    },
                    body: Column(children: [
                      TabBar(
                        indicatorWeight: 3,
                        tabs: [
                          _tabForm(icon: Icons.article_rounded, title: '리뷰'),
                          _tabForm(
                              icon: Icons.bookmark_add_rounded, title: '북마크'),
                        ],
                        indicatorColor: appMainColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          profileReviewWidget(
                              isMe: isMe,
                              context: context,
                              review: context
                                  .watch<ProfileState>()
                                  .profileModelList
                                  .where((element) => element
                                      .userProfile.userKey
                                      .contains(userKey))
                                  .map((e) => e.review)
                                  .firstOrNull!),
                          profileBookmarkWidget(
                            context: context,
                            book: context
                                .watch<ProfileState>()
                                .profileModelList
                                .where((element) => element.userProfile.userKey
                                    .contains(userKey))
                                .map((e) => e.book)
                                .firstOrNull!,
                          ),
                        ],
                      ))
                    ])),
              ),
            ),
            const SettingDrawerPage(),
          ],
        ),
      ),
    );
  }

  Tab _tabForm({
    required IconData icon,
    required String title,
  }) {
    return Tab(
      height: size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 12),
          Text(title,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14))
        ],
      ),
    );
  }
}
