import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () {
                context.read<AuthState>().signInWithAnnoymouse();
              },
              child: Text('SIngIN'))),
    );
  }
}
