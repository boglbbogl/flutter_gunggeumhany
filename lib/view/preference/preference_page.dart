import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/preference_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/preference/preference_book_widget.dart';
import 'package:flutter_gunggeumhany/view/preference/preference_shimmer_widget.dart';
import 'package:provider/provider.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceState>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () async {
                    provider
                      ..createUserPreferenceResearch(
                          context: context,
                          userKey:
                              context.read<AuthState>().userProfile!.userKey)
                      ..getPreferenceModel(
                          userKey:
                              context.read<AuthState>().userProfile!.userKey);
                    await context.read<AuthState>().getMyInformation(
                        userKey:
                            context.read<AuthState>().userProfile!.userKey);
                  },
                  child: provider.bookList.isEmpty || provider.isLoading
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: CircularProgressIndicator(
                            color: appMainColor,
                          ),
                        )
                      : Text('저장하기',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: appMainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
            ],
          ),
          body: provider.bookList.isEmpty || provider.isLoading
              ? preferenceShimmerWidget()
              : ListView(shrinkWrap: true, children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 8, bottom: 4, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              color: Color.fromRGBO(215, 215, 215, 1),
                            ),
                            const SizedBox(width: 8),
                            DefaultTextStyle(
                              style: theme.textTheme.bodyText2!.copyWith(
                                  color: const Color.fromRGBO(215, 215, 215, 1),
                                  fontSize: 10),
                              child: Column(
                                children: const [
                                  Text('읽은 책에 별점을 남겨주세요'),
                                  SizedBox(height: 2),
                                  Text('책 추천 서비스에 사용 됩니다'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          context
                              .watch<AuthState>()
                              .userInformation!
                              .preference
                              .length
                              .toString(),
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: appMainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ...provider.bookList.map(
                      (e) => preferenceBookWidget(book: e, context: context)),
                  SizedBox(
                    height: 60,
                    child: IconButton(
                        onPressed: () {},
                        icon: Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: const Icon(Icons.refresh_rounded))),
                  ),
                  const SizedBox(height: 12),
                ]),
        );
      },
    );
  }
}
