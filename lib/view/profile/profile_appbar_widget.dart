import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/activity_state.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/profile_state.dart';
import 'package:flutter_gunggeumhany/view/blocked/user_inapposite_list_widget.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

AppBar profileAppbarWidget({
  required BuildContext context,
  required bool isMe,
  required bool isFollowers,
  required String userNickName,
  required String userKey,
}) {
  return AppBar(
    title: !isMe && isFollowers
        ? RichText(
            text: TextSpan(
                text: "@$userNickName",
                style: theme.textTheme.bodyText2!.copyWith(
                  color: appMainColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                TextSpan(
                  text: ' 님이 팔로우 합니다',
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]))
        : Text(
            userNickName,
            style: theme.textTheme.bodyText2!.copyWith(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
    actions: [
      if (isMe) ...[
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: context.watch<ProfileState>().isDrawer
                ? _iconForm(
                    key: 'drawer',
                    onTap: () => context
                        .read<ProfileState>()
                        .openAndCloseDrawer(value: false),
                    icon: Icons.clear_rounded)
                : _iconForm(
                    onTap: () => context
                        .read<ProfileState>()
                        .openAndCloseDrawer(value: true),
                    icon: Icons.menu_rounded))
      ],
      if (!isMe &&
          !context.watch<AuthState>().userProfile!.userKey.contains(userKey) &&
          !context
              .watch<AuthState>()
              .userActivity!
              .blockedUserUserKey
              .contains(userKey)) ...[
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  isDismissible: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _blockedButtonForm(
                              title: '신고하기',
                              color: Colors.orange,
                              icon: Icons.error_outline_rounded,
                              onTap: () {
                                Navigator.of(context).pop();
                                userInappositeListWidget(
                                    context: context,
                                    inappositeUserKey: userKey);
                              }),
                          _blockedButtonForm(
                              title: '차단하기',
                              color: Colors.red,
                              icon: Icons.remove_circle_outline_rounded,
                              onTap: () async {
                                Navigator.of(context).pop();
                                await context
                                    .read<ActivityState>()
                                    .userBlockedRequest(
                                      userKey: context
                                          .read<AuthState>()
                                          .userProfile!
                                          .userKey,
                                      blockedUserKey: userKey,
                                    );
                                await context.read<AuthState>().getMyUserModel(
                                    userKey: context
                                        .read<AuthState>()
                                        .userProfile!
                                        .userKey);
                              }),
                          _blockedButtonForm(
                              title: '취소',
                              color: Colors.white,
                              icon: Icons.clear_rounded,
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.more_vert_rounded))
      ],
    ],
  );
}

Padding _blockedButtonForm({
  required String title,
  required IconData icon,
  required Function() onTap,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
    child: Column(
      children: [
        Shimmer.fromColors(
          baseColor: color,
          highlightColor: const Color.fromRGBO(215, 215, 215, 1),
          child: Container(
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: color, width: 3),
            ),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(icon, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(215, 215, 215, 1),
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

IconButton _iconForm({
  required Function() onTap,
  required IconData icon,
  String? key,
}) {
  return IconButton(
    key: ValueKey(key),
    onPressed: onTap,
    icon: Icon(icon),
  );
}
