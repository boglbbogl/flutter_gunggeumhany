import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthState>().isLogin) {
      return Scaffold(
        body: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
                FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 5000)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Positioned(
                            bottom: 50,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Center(child: Text('다시 로그인하기'))));
                      }
                      return Container();
                    }),
              ],
            )),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/sign_in_main.jpg',
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white70,
                  highlightColor: Colors.white,
                  child: Text(
                    '궁금하니',
                    style: TextStyle(
                      fontFamily: AppFonts().bMDoHyeon,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _loginButtonForm(
                        onTap: () => context
                            .read<AuthState>()
                            .signInWithKakao(context: context),
                        assets: 'kakao-talk',
                        isLoading: context.watch<AuthState>().isKakaoLogin,
                        padding: 10),
                    _loginButtonForm(
                        onTap: () => context
                            .read<AuthState>()
                            .signInWithGoogle(context: context),
                        assets: 'google',
                        isLoading: context.watch<AuthState>().isGoogleLogin,
                        padding: 12),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell _loginButtonForm(
      {required Function() onTap,
      required String assets,
      required bool isLoading,
      required double padding}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.white70,
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Image.asset('assets/images/$assets.png'),
            ),
          ),
        ],
      ),
    );
  }
}
