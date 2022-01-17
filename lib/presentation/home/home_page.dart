import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_fonts.dart';
import 'package:flutter_gunggeumhany/presentation/home/home_appbar_widget.dart';
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
      appBar: homeAppbarWidget(context: context),
    );
  }
}
