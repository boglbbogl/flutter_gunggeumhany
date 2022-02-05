import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_fonts.dart';
import 'package:flutter_gunggeumhany/view/core/user_image.dart';
import 'package:flutter_gunggeumhany/view/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

AppBar homeAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: false,
    title: Text(
      '궁금하니',
      style: theme.appBarTheme.titleTextStyle!
          .copyWith(fontFamily: AppFonts().bMDoHyeon, fontSize: 25),
    ),
    actions: [
      IconButton(
          onPressed: () {
            pushNewScreen(context,
                screen: const SearchScreen(),
                pageTransitionAnimation: PageTransitionAnimation.cupertino);
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          )),
      if (context.watch<AuthState>().userProfile != null) ...[
        userImage(
            imageUrl:
                context.watch<AuthState>().userProfile!.presentProfileImageUrl,
            context: context),
      ],
      const SizedBox(width: 8),
    ],
  );
}
