import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/activity_state.dart';
import 'package:flutter_gunggeumhany/state/aladin_state.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/main_state.dart';
import 'package:flutter_gunggeumhany/state/preference_state.dart';
import 'package:flutter_gunggeumhany/state/profile_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/_app/main_screen.dart';
import 'package:flutter_gunggeumhany/view/core/app_theme.dart';
import 'package:provider/provider.dart';

class HanyApp extends StatelessWidget {
  const HanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainState()),
        ChangeNotifierProvider(create: (context) => AuthState()),
        ChangeNotifierProvider(create: (context) => BookState()),
        ChangeNotifierProvider(create: (context) => ReviewState()),
        ChangeNotifierProvider(create: (context) => ActivityState()),
        ChangeNotifierProvider(create: (context) => ProfileState()),
        ChangeNotifierProvider(create: (context) => SettingState()),
        ChangeNotifierProvider(create: (context) => AladinState()),
        ChangeNotifierProvider(create: (context) => PreferenceState()),
      ],
      child: MaterialApp(
        // home: MainScreen(),
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        routes: {
          "/": (context) => const MainScreen(),
        },
      ),
      // child: MaterialApp.router(
      //   routeInformationParser: BeamerParser(),
      //   routerDelegate: routerDelegate,
      //   theme: AppTheme.darkTheme,
      // ),
    );
  }
}
