import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/setting/customer_service_list_page.dart';
import 'package:flutter_gunggeumhany/view/setting/customer_service_request_page.dart';
import 'package:flutter_gunggeumhany/view/setting/not_search_book_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
              title: '개선 사항 요청',
              icon: Icons.create_rounded,
              onTap: () => pushNewScreen(context,
                  screen: CustomerServiceRequestPage(
                    category: "Improve",
                  ))),
          _listTileForm(
              title: '불편 신고 요청',
              icon: Icons.error_outline_rounded,
              onTap: () => pushNewScreen(context,
                  screen: CustomerServiceRequestPage(
                    category: "Complain",
                  ))),
          _listTileForm(
            title: '접수 결과',
            icon: Icons.list_rounded,
            onTap: () async {
              await context.read<SettingState>().getCustomerServiceList(
                  userKey: context.read<AuthState>().userProfile!.userKey);
              pushNewScreen(context, screen: const CustomerServiceListPage());
            },
          ),
          _listTileForm(
            title: '검색 안되는 책 등록',
            icon: Icons.collections_bookmark_outlined,
            onTap: () {
              pushNewScreen(context, screen: NotSearchBookPage());
            },
          ),
          _listTileForm(
              title: '로그아웃',
              icon: Icons.logout_rounded,
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..pop();
                context.read<AuthState>().signOut(
                      provider: context.read<AuthState>().userProfile!.provider,
                    );
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
