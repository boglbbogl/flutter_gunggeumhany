import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _age = [
      "0-9",
      "10-19",
      "20-29",
      "30-39",
      "40-49",
      "50-59",
      "60-69",
      "70-79",
      "80-89",
      "90-99",
      "100+"
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                await context.read<SettingState>().updateUserInformation(
                    userKey: context.read<AuthState>().userProfile!.userKey);
                context.read<AuthState>().getMyInformation(
                    userKey: context.read<AuthState>().userProfile!.userKey);
                Navigator.of(context).pop();
              },
              child: Text('저장하기',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appMainColor, fontWeight: FontWeight.bold))),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  size: 13,
                  color: Color.fromRGBO(175, 175, 175, 1),
                ),
                const SizedBox(width: 4),
                Text('자세한 정보를 입력해 주시면 정확한 추천 서비스를 제공합니다',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(175, 175, 175, 1),
                        fontSize: 11))
              ],
            ),
            const SizedBox(height: 20),
            _titleForm(title: '성별'),
            const SizedBox(height: 12),
            Row(
              children: [
                _genderForm(
                    context: context,
                    genderIndex: 1,
                    image: 'assets/images/man_symbol.png',
                    isGender: context.watch<SettingState>().genderIndex == 1),
                const SizedBox(width: 8),
                _genderForm(
                    context: context,
                    genderIndex: 2,
                    image: 'assets/images/woman_symbol.png',
                    isGender: context.watch<SettingState>().genderIndex == 2),
              ],
            ),
            const SizedBox(height: 20),
            _titleForm(title: '연령'),
            const SizedBox(height: 12),
            Wrap(
              children: [
                ..._age.map((e) => Padding(
                      padding: const EdgeInsets.only(right: 8, top: 12),
                      child: InkWell(
                        onTap: () {
                          context.read<SettingState>().changedAge(age: e);
                        },
                        child: Container(
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                border: context.watch<SettingState>().age == e
                                    ? Border.all(width: 2, color: appMainColor)
                                    : Border.all(width: 2),
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Center(
                                  child: Text(
                                e,
                                style: theme.textTheme.bodyText2!.copyWith(
                                    fontWeight:
                                        context.watch<SettingState>().age == e
                                            ? FontWeight.bold
                                            : FontWeight.w400,
                                    color:
                                        context.watch<SettingState>().age == e
                                            ? appMainColor
                                            : const Color.fromRGBO(
                                                195, 195, 195, 1)),
                              )),
                            )),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Text _titleForm({
    required String title,
  }) {
    return Text(title,
        style: theme.textTheme.bodyText2!.copyWith(
            color: appMainColor, fontSize: 15, fontWeight: FontWeight.bold));
  }

  Container _genderForm({
    required String image,
    required bool isGender,
    required int genderIndex,
    required BuildContext context,
  }) {
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.04,
      decoration: BoxDecoration(
        border: isGender
            ? Border.all(color: appMainColor, width: 2)
            : Border.all(width: 2),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(71, 71, 71, 1),
      ),
      child: InkWell(
        onTap: () {
          context.read<SettingState>().changedGender(index: genderIndex);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            color: isGender
                ? appMainColor
                : const Color.fromRGBO(195, 195, 195, 1),
          ),
        ),
      ),
    );
  }
}
