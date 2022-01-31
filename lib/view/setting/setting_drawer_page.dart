import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/preference_state.dart';
import 'package:flutter_gunggeumhany/state/profile_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/preference/preference_page.dart';
import 'package:flutter_gunggeumhany/view/setting/api_screen.dart';
import 'package:flutter_gunggeumhany/view/setting/setting_page.dart';
import 'package:flutter_gunggeumhany/view/setting/setting_profile_update_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class SettingDrawerPage extends StatelessWidget {
  const SettingDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size.width * 0.5,
      height: size.height,
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
          context.watch<ProfileState>().isDrawer
              ? size.width * 0.5
              : size.width,
          0,
          0),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            _listTileForm(
                icon: Icons.account_circle_rounded,
                title: '프로필',
                onTap: () {
                  context.read<SettingState>().started(
                      isSocial: context
                          .read<AuthState>()
                          .userProfile!
                          .presentProfileImageUrl
                          .contains(context
                              .read<AuthState>()
                              .userProfile!
                              .socialProfileImageUrl));
                  context.read<ProfileState>().openAndCloseDrawer(value: false);
                  pushNewScreen(context, screen: SettingProfileUpdatePage());
                }),
            _listTileForm(
                icon: Icons.settings_rounded,
                title: '설정',
                onTap: () {
                  context.read<ProfileState>().openAndCloseDrawer(value: false);
                  pushNewScreen(context, screen: const SettingPage());
                }),
            _listTileForm(
                icon: Icons.star_rounded,
                title: '선호도 조사',
                onTap: () {
                  pushNewScreen(context,
                      screen: ChangeNotifierProvider(
                          create: (context) => PreferenceState(
                              userKey: context
                                  .read<AuthState>()
                                  .userProfile!
                                  .userKey),
                          child: const PreferencePage()));
                }),
            _listTileForm(
                icon: Icons.error_outline_rounded,
                title: 'API',
                onTap: () {
                  pushNewScreen(context, screen: const ApiScreen());
                }),
          ],
        ),
      ),
    );
  }

  ListTile _listTileForm({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white, size: 20),
        title: Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ));
  }
}
