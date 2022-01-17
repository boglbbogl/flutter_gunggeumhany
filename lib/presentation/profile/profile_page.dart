import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/profile/setting_drawer_page.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final bool isMe;
  const ProfilePage({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<ProfileState>().profileModel == null) {
      return CircularProgressIndicator();
    }
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(
                context.watch<ProfileState>().isDrawer ? -size.width * 0.5 : 0,
                0,
                0),
            child: Scaffold(
              appBar: profileAppbarWidget(context: context, isMe: isMe),
              body: NestedScrollView(
                  headerSliverBuilder: (context, value) {
                    return [SliverList(delegate: SliverChildListDelegate([]))];
                  },
                  body: Column(children: [
                    TabBar(
                      tabs: [
                        _tabForm(icon: Icons.article_rounded, title: '리뷰'),
                        _tabForm(
                            icon: Icons.bookmark_add_rounded, title: '북마크'),
                      ],
                      indicatorColor: appMainColor,
                      indicatorSize: TabBarIndicatorSize.label,
                    ),
                    Expanded(
                        child: TabBarView(
                      children: [
                        Tab(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ...context
                                  .watch<ProfileState>()
                                  .profileModel!
                                  .review
                                  .map((e) => Text(e.contents))
                            ],
                          ),
                        ),
                        Tab(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ...context
                                  .watch<ProfileState>()
                                  .profileModel!
                                  .book
                                  .map((e) => Text(e.title))
                            ],
                          ),
                        ),
                      ],
                    ))
                  ])),
            ),
          ),
          const SettingDrawerPage(),
        ],
      ),
    );
  }

  Tab _tabForm({
    required IconData icon,
    required String title,
  }) {
    return Tab(
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
