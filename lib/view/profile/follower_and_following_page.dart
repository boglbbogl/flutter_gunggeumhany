import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/state/activity_state.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/profile_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/profile/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class FollowAndFollowingPage extends StatelessWidget {
  const FollowAndFollowingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: appMainColor,
                unselectedLabelColor: const Color.fromRGBO(155, 155, 155, 1),
                tabs: const [
                  Tab(text: '팔로우'),
                  Tab(text: '팔로잉'),
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                _followerAndFollowingListForm(
                    context: context,
                    userList: context.watch<ActivityState>().followerList),
                _followerAndFollowingListForm(
                    context: context,
                    userList: context.watch<ActivityState>().followingList),
              ],
            ),
          ),
        ));
  }

  ListView _followerAndFollowingListForm({
    required BuildContext context,
    required List<UserProfile> userList,
  }) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...userList.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<ProfileState>()
                          .getUserReviewAndProfile(userKey: e.userKey);
                      pushNewScreen(context,
                          screen: ProfilePage(
                            isMe: false,
                            userKey: e.userKey,
                          ));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.08,
                          height: size.width * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                  imageUrl: e.presentProfileImageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          e.nickName,
                          style: theme.textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      child: context
                              .watch<AuthState>()
                              .userActivity!
                              .followingUserKey
                              .contains(e.userKey)
                          ? _iconButtonForm(
                              icon: Icons.favorite_rounded,
                              color: Colors.pink,
                              onTap: () async {
                                await context
                                    .read<ActivityState>()
                                    .removeFollowing(
                                        myUserKey: context
                                            .read<AuthState>()
                                            .userProfile!
                                            .userKey,
                                        followingUserKey: e.userKey);
                                context.read<AuthState>().getMyUserModel(
                                      userKey: context
                                          .read<AuthState>()
                                          .userProfile!
                                          .userKey,
                                    );
                              })
                          : _iconButtonForm(
                              icon: Icons.favorite_border_rounded,
                              color: Colors.white,
                              onTap: () async {
                                await context
                                    .read<ActivityState>()
                                    .addFollowing(
                                        myUserKey: context
                                            .read<AuthState>()
                                            .userProfile!
                                            .userKey,
                                        followingUserKey: e.userKey);
                                context.read<AuthState>().getMyUserModel(
                                      userKey: context
                                          .read<AuthState>()
                                          .userProfile!
                                          .userKey,
                                    );
                              })),
                ],
              ),
            )),
      ],
    );
  }

  IconButton _iconButtonForm({
    required Function() onTap,
    required IconData icon,
    required Color color,
  }) {
    return IconButton(
        onPressed: onTap, icon: Icon(icon, color: color, size: 18));
  }
}
