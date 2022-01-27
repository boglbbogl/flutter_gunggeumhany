import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

Column updateProfileNicknameWidget({
  required TextEditingController controller,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '닉네임',
        style: theme.textTheme.bodyText2!.copyWith(
            color: appMainColor, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter(RegExp("[a-z_0-9]"), allow: true)
              ],
              readOnly: context.watch<SettingState>().isReadOnly,
              controller: controller,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: !context.watch<SettingState>().isReadOnly
                ? TextButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        context.read<SettingState>().nickNameDuplication(
                            nickName: controller.text, context: context);
                      }
                    },
                    child: Text(
                      '확인',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: appSubColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ))
                : Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<SettingState>()
                              .showIsReadOnly(value: false);
                        },
                        icon: const Icon(
                          Icons.create_rounded,
                          size: 22,
                        )),
                  ),
          ),
        ],
      ),
    ],
  );
}
