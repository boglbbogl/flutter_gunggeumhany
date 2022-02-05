import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

class CustomerServiceRequestPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String category;

  CustomerServiceRequestPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context
                      .read<SettingState>()
                      .requestCustomerServiceComplainAndImprove(
                        userKey: context.read<AuthState>().userProfile!.userKey,
                        content: _controller.text,
                        email: context.read<AuthState>().userProfile!.email,
                        category: category,
                      );
                  Navigator.of(context).pop();
                  _controller.clear();
                }
              },
              child: Text(
                '접수하기',
                style: theme.textTheme.bodyText2!.copyWith(
                    color: appMainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(51, 51, 51, 1)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextFormField(
                    controller: _controller,
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: Colors.white, fontSize: 12),
                    maxLines: 12,
                    decoration: const InputDecoration(
                      hintText: '신고 내용을 작성해 주세요',
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
