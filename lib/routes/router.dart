import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/routes/handler.dart';

class HanyRouter {
  static FluroRouter? router;
}

class Routes {
  static void configureRouter(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    router.define(
      "/",
      handler: splashRouter,
    );
    router.define(
      "/signIn",
      handler: signInRouter,
    );
    router.define(
      "/home",
      handler: homeRouter,
    );
  }
}
