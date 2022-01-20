import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/setting/api_screen.dart';
import 'package:flutter_gunggeumhany/presentation/setting/setting_profile_update_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:flutter_gunggeumhany/service/setting_state.dart';
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
                  context.read<SettingState>().started();
                  context.read<ProfileState>().openAndCloseDrawer(value: false);
                  pushNewScreen(context, screen: SettingProfileUpdatePage());
                }),
            _listTileForm(
                icon: Icons.logout_rounded,
                title: '로그아웃',
                onTap: () {
                  context.read<AuthState>().signOut();
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
