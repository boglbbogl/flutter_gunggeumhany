import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/aladin_state.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTextStyle(
        style: theme.textTheme.bodyText2!.copyWith(
            color: appMainColor, fontSize: 18, fontWeight: FontWeight.bold),
        child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinBestsellerToFirestoreLogic();
                  },
                  child: const Text('알라딘 베스트셀러')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinBestsellerForeignToFirestoreLogic();
                  },
                  child: const Text('알라딘 베스트셀러(외국)')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    context.read<AladinState>().aladinNewBookToFirestoreLogic();
                  },
                  child: const Text('알라딘 신간')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinSpecialNewBookToFirestoreLogic();
                  },
                  child: const Text('알라딘 주목할 만한 신간')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinRecommendBlogToFirestoreLogic();
                  },
                  child: const Text('블로그 추천')),
            ],
          ),
        ),
      ),
    );
  }
}
