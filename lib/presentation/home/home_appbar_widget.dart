import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_fonts.dart';
import 'package:flutter_gunggeumhany/presentation/core/user_image.dart';
import 'package:flutter_gunggeumhany/presentation/search/search_screen.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
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
          .copyWith(fontFamily: AppFonts().jua, fontSize: 25),
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
      userImage(
          imageUrl: context.watch<AuthState>().userProfile!.imageUrl,
          context: context),
      const SizedBox(width: 8),
    ],
  );
}