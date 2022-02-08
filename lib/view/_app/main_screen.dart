import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/main_state.dart';
import 'package:flutter_gunggeumhany/view/auth/sign_in_page.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_fonts.dart';
import 'package:flutter_gunggeumhany/view/home/home_page.dart';
import 'package:flutter_gunggeumhany/view/splash/error_screen.dart';
import 'package:flutter_gunggeumhany/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<AuthState>(
      builder: (context, provider, child) {
        if (provider.userProfile != null &&
            !provider.isLogin &&
            context.watch<MainState>().bestsellerList.isNotEmpty) {
          return const HomePage();
        } else if (provider.userProfile == null && !provider.isLogin) {
          return const SignInPage();
        } else if (provider.isLogin ||
            context.watch<MainState>().bestsellerList.isEmpty) {
          return const SplashScreen();
        }
        return const ErrorScreen();
      },
    );
  }
}
