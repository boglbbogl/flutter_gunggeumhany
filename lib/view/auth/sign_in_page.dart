import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () async {
                  await context
                      .read<AuthState>()
                      .signInWithGoogle(context: context);
                },
                child: Text('GOOGLE')),
            InkWell(
                onTap: () async {
                  await context
                      .read<AuthState>()
                      .signInWithKakao(context: context);
                },
                child: Text('KAKAO')),
          ],
        ),
      ),
    );
  }
}
