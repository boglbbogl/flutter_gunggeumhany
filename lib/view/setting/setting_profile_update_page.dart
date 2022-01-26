import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/setting/update_profile_nickname_widget.dart';
import 'package:provider/provider.dart';

class SettingProfileUpdatePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  SettingProfileUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = context.read<SettingState>().changedNickName.isEmpty
        ? context.read<AuthState>().userProfile!.nickName
        : context.read<SettingState>().changedNickName;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            if (context.watch<SettingState>().isUpdate)
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 15, top: 15, bottom: 15),
                child: CircularProgressIndicator(
                  color: appMainColor,
                ),
              )
            else
              TextButton(
                  onPressed: () async {
                    await context.read<SettingState>().updateUserProfile(
                        userProfile: context.read<AuthState>().userProfile!,
                        context: context);
                    await context.read<AuthState>().getMyUserModel(
                        userKey:
                            context.read<AuthState>().userProfile!.userKey);
                  },
                  child: Text(
                    '저장하기',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: appMainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              updateProfileNicknameWidget(
                  controller: _controller, context: context),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '프로필 이미지',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: appMainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: context
                                          .watch<SettingState>()
                                          .pickedImage !=
                                      null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Image.memory(
                                        context
                                            .watch<SettingState>()
                                            .pickedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: CachedNetworkImage(
                                        imageUrl: context
                                            .watch<AuthState>()
                                            .userProfile!
                                            .profileImageUrl,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ),
                                    ),
                            ),
                          ),
                          if (context
                              .watch<SettingState>()
                              .isImageSelected) ...[
                            const Positioned(
                              top: 30,
                              bottom: 30,
                              right: 30,
                              left: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ],
                          Positioned(
                            right: -5,
                            top: -5,
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<SettingState>()
                                    .changedProfileImage();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: darkThemeMainColor),
                                child: const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<SettingState>()
                                  .selectedIsSocialOrLocalProfileImage(
                                      value: false);
                            },
                            icon: context
                                        .watch<SettingState>()
                                        .isSocialProfileImage ??
                                    false
                                ? const Icon(
                                    Icons.circle_outlined,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.circle_rounded,
                                    size: 24,
                                    color: appSubColor,
                                  )),
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: CachedNetworkImage(
                              imageUrl: context
                                  .watch<AuthState>()
                                  .userProfile!
                                  .socialProfileImageUrl,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<SettingState>()
                                  .selectedIsSocialOrLocalProfileImage(
                                      value: true);
                            },
                            icon: context
                                        .watch<SettingState>()
                                        .isSocialProfileImage ??
                                    false
                                ? Icon(
                                    Icons.circle_rounded,
                                    size: 24,
                                    color: appSubColor,
                                  )
                                : const Icon(Icons.circle_outlined, size: 20)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4),
                    child: Text(
                      "Profile With ${context.watch<AuthState>().userProfile!.provider}",
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
