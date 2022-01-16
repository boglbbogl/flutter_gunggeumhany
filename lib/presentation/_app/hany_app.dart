import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_theme.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/book_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:flutter_gunggeumhany/service/router/router.dart';
import 'package:flutter_gunggeumhany/service/sign_in_state.dart';
import 'package:provider/provider.dart';

class HanyApp extends StatelessWidget {
  const HanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthState()),
        ChangeNotifierProvider(create: (context) => SignInState()),
        ChangeNotifierProvider(create: (context) => BookState()),
        ChangeNotifierProvider(create: (context) => ReviewState()),
      ],
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
