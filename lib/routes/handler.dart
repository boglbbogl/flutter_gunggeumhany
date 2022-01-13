import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gunggeumhany/home_page.dart';
import 'package:flutter_gunggeumhany/sign_in_page.dart';
import 'package:flutter_gunggeumhany/splash_screen.dart';

Handler splashRouter = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return const SplashScreen();
});

Handler signInRouter = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return const SignInPage();
});
Handler homeRouter = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return const HomePage();
});
