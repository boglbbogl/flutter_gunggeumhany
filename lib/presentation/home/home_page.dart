import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/book_repo.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/search/search_screen.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/book_state.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('궁금하니'),
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
              ))
        ],
      ),
    );
  }
}
