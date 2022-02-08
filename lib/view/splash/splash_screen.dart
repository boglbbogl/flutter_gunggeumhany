import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 20000), () => 0),
        builder: (context, snapshot) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/splash_main.gif",
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  bottom: 50,
                  child: SizedBox(
                    width: size.width,
                    child: Shimmer.fromColors(
                        baseColor: Colors.white10,
                        highlightColor: Colors.grey.shade200,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '사용자 정보 불러오는 중',
                                style: theme.textTheme.bodyText2!.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: AppFonts().jua,
                                ),
                              ),
                              const Icon(
                                Icons.more_horiz_rounded,
                                size: 24,
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                if (snapshot.hasData) ...[
                  Positioned(
                    bottom: 50,
                    child: Container(
                      width: size.width,
                      color: const Color.fromRGBO(71, 71, 71, 1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: GestureDetector(
                          onTap: () {
                            context.read<AuthState>().reSignIn();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '다시 시도',
                                style: theme.textTheme.bodyText2!.copyWith(
                                  color: appMainColor,
                                  fontSize: 24,
                                  fontFamily: AppFonts().jua,
                                ),
                              ),
                              Icon(
                                Icons.double_arrow_rounded,
                                size: 28,
                                color: appMainColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        });
  }
}
