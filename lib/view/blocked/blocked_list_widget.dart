import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/blocked/blocked_local_data.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

Future blockedListWidget({
  required BuildContext context,
  required String reviewDocKey,
  required String blockedUserKey,
  required String bookDocKey,
}) {
  return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height * 0.8,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Color.fromRGBO(51, 51, 51, 1)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 8, left: size.width * 0.3, right: size.width * 0.3),
                child: Container(
                  width: size.width,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.error_outline_rounded,
                              size: 22, color: appSubColor),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              '????????? ????????? ??? ??? ????????? ??? ????????? ?????? ????????? ?????? ????????? ????????? ????????? ?????? ??? ????????????',
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: appSubColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                          '?????? ????????? ??? ?????? ???????????? ?????? ?????? ???????????? ????????? ????????? ????????? ?????? ????????? ????????? ????????? ?????? ?????? ??? ????????????',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(155, 155, 155, 1),
                              fontSize: 12)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width * 0.9,
                        child: Text(
                          '?????? ????????? ????????? ?????????',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: appMainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: size.width * 0.9,
                          height: 1.1,
                          color: const Color.fromRGBO(71, 71, 71, 1)),
                      const SizedBox(height: 10),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ...BlockedLocalData().feed.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: InkWell(
                                  onTap: () async {
                                    await context
                                        .read<ReviewState>()
                                        .blokedReview(
                                          context: context,
                                          category: e,
                                          myUserKey: context
                                              .read<AuthState>()
                                              .userProfile!
                                              .userKey,
                                          reviewDocKey: reviewDocKey,
                                          blockedUserKey: blockedUserKey,
                                          bookDocKey: bookDocKey,
                                        );
                                    context.read<AuthState>().getMyUserModel(
                                        userKey: context
                                            .read<AuthState>()
                                            .userProfile!
                                            .userKey);
                                  },
                                  child: Text(e,
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(fontSize: 15)),
                                ),
                              )),
                          const SizedBox(height: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
