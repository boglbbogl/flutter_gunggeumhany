import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/auth_state.dart';
import 'package:flutter_gunggeumhany/routes/router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, value, child) {
        if (value.user != null) {
          HanyRouter.router?.navigateTo(context, '/home');
        } else if (value.user == null) {
          HanyRouter.router?.navigateTo(context, '/signIn');
        } else {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: Colors.amber,
        );
      },
    );
  }
}
