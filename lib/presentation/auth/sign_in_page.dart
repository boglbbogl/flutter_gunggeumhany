import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/sign_in_state.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () async {
                await context.read<SignInState>().signInWithAnnoymouse();
                await context.read<AuthState>().userChecked();
              },
              child: Text('SIngIN'))),
    );
  }
}
