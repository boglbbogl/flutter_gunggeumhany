import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:provider/provider.dart';

AppBar profileAppbarWidget({
  required BuildContext context,
  required bool isMe,
  required String userNickName,
}) {
  return AppBar(
    title: Text(
      userNickName,
      style: theme.textTheme.bodyText2!.copyWith(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    ),
    actions: [
      if (isMe) ...[
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: context.watch<ProfileState>().isDrawer
                ? _iconForm(
                    key: 'drawer',
                    onTap: () => context
                        .read<ProfileState>()
                        .openAndCloseDrawer(value: false),
                    icon: Icons.clear_rounded)
                : _iconForm(
                    onTap: () => context
                        .read<ProfileState>()
                        .openAndCloseDrawer(value: true),
                    icon: Icons.menu_rounded))
      ],
    ],
  );
}

IconButton _iconForm({
  required Function() onTap,
  required IconData icon,
  String? key,
}) {
  return IconButton(
    key: ValueKey(key),
    onPressed: onTap,
    icon: Icon(icon),
  );
}
