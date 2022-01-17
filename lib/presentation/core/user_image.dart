import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/profile/profile_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

InkWell userImage({
  required String imageUrl,
  required BuildContext context,
  double? radius = 27,
}) {
  return InkWell(
    onTap: () async {
      await context.read<ProfileState>().getUserReviewAndProfile(
          userKey: context.read<AuthState>().userProfile!.userKey);
      context.read<ProfileState>().openAndCloseDrawer(value: false);
      pushNewScreen(context,
          screen: const ProfilePage(
            isMe: true,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: radius,
        height: radius,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ),
                ),
                fit: BoxFit.cover,
                fadeOutDuration: const Duration(milliseconds: 5),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

InkWell userImageAndName({
  required String imageUrl,
  required String nickName,
  required BuildContext context,
  required String userKey,
  double? radius = 25,
}) {
  return InkWell(
    onTap: () async {
      await context
          .read<ProfileState>()
          .getUserReviewAndProfile(userKey: userKey);
      context.read<ProfileState>().openAndCloseDrawer(value: false);
      pushNewScreen(context,
          screen: const ProfilePage(
            isMe: false,
          ));
    },
    child: Row(
      children: [
        SizedBox(
          width: radius,
          height: radius,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: radius,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ),
                  fit: BoxFit.cover,
                  fadeOutDuration: const Duration(milliseconds: 5),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          nickName,
          style: theme.textTheme.bodyText2!.copyWith(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
