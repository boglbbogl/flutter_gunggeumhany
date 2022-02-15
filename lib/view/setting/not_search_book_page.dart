import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';
import 'package:provider/provider.dart';

class NotSearchBookPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  NotSearchBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty ||
                        _isbnController.text.isNotEmpty) {
                      context.read<SettingState>().setNotSearchBook(
                          title: _titleController.text,
                          isbn: _isbnController.text);
                      Navigator.of(context).pop();
                    } else {
                      appFlushbar(message: '제목 또는 ISBN 숫자를 입력해 주세요')
                          .show(context);
                    }
                  },
                  child: Text('등록하기',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: appMainColor, fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                _errorForm(
                  title: '검색 안되는 책을 등록해 주시면 책을 추가해 드립니다',
                ),
                const SizedBox(height: 8),
                _errorForm(title: '책 이름이나 ISBN 번호를 알려주세요'),
                const SizedBox(height: 18),
                _infoInputForm(
                    title: '책 제목',
                    type: TextInputType.text,
                    controller: _titleController),
                const SizedBox(height: 12),
                _infoInputForm(
                    title: 'ISBN',
                    type: TextInputType.number,
                    controller: _isbnController),
              ],
            ),
          )),
    );
  }

  Column _infoInputForm({
    required String title,
    required TextInputType type,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(title,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: appMainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Container(
            width: size.width * 0.7,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(71, 71, 71, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 8, right: 8),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: Colors.white, fontSize: 12),
                  keyboardType: type,
                ),
              ),
            ))
      ],
    );
  }

  Row _errorForm({
    required String title,
  }) {
    return Row(
      children: [
        const Icon(Icons.error_outline_rounded,
            size: 14, color: Color.fromRGBO(175, 175, 175, 1)),
        const SizedBox(width: 4),
        Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
              fontSize: 12, color: const Color.fromRGBO(175, 175, 175, 1)),
        ),
      ],
    );
  }
}
