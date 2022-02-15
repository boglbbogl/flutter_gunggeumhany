import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: darkThemeMainColor,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text(
                      '정보를 불러오지 못하고 있습니다',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: Colors.white60,
                          fontFamily: AppFonts().jua,
                          fontSize: 32),
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.05,
                child: GestureDetector(
                  onTap: () => context.read<AuthState>().reSignIn(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '다시 시도',
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: appMainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts().jua,
                          fontSize: 28,
                        ),
                      ),
                      Icon(Icons.double_arrow_rounded,
                          size: 32, color: appMainColor),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
