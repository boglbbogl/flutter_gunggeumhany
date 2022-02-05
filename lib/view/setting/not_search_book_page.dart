import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

class NotSearchBookPage extends StatelessWidget {
  const NotSearchBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _errorForm(),
            ],
          ),
        ));
  }

  Row _errorForm() {
    return Row(
      children: [
        const Icon(Icons.error_outline_rounded,
            size: 18, color: Color.fromRGBO(195, 195, 195, 1)),
        const SizedBox(width: 4),
        Text(
          '검색 안되는 책을 등록해 주시면 책을 추가해 드립니다',
          style: theme.textTheme.bodyText2!.copyWith(
              fontSize: 14, color: const Color.fromRGBO(195, 195, 195, 1)),
        ),
      ],
    );
  }
}
