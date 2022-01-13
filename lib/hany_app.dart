import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/auth_state.dart';
import 'package:flutter_gunggeumhany/routes/router.dart';
import 'package:provider/provider.dart';

class HanyApp extends StatelessWidget {
  const HanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = FluroRouter();
    Routes.configureRouter(_router);
    HanyRouter.router = _router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthState()),
      ],
      child: MaterialApp(
        onGenerateRoute: HanyRouter.router!.generator,
      ),
    );
  }
}
