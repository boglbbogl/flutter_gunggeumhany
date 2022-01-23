import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          _listTileForm(
              title: '로그아웃',
              icon: Icons.logout_rounded,
              onTap: () {
                context.read<AuthState>().signOut();
              }),
        ],
      ),
    );
  }

  ListTile _listTileForm({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: theme.textTheme.bodyText2!.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading:
          IconButton(onPressed: () {}, icon: Icon(icon, color: Colors.white)),
    );
  }
}
