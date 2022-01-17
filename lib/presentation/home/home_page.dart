import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_fonts.dart';
import 'package:flutter_gunggeumhany/presentation/search/search_screen.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '궁금하니',
          style: theme.appBarTheme.titleTextStyle!
              .copyWith(fontFamily: AppFonts().jua, fontSize: 23),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await context.read<AuthState>().signOut();
              },
              icon: const Icon(
                Icons.clear,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                pushNewScreen(context,
                    screen: const SearchScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
    );
  }
}
