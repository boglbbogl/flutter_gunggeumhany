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
              _apiForm(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinBestsellerToFirestoreLogic();
                  },
                  isLoading: context.watch<AladinState>().isBestsellerLoading,
                  title: '알라딘 베스트셀러'),
              _apiForm(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinBestsellerForeignToFirestoreLogic();
                  },
                  isLoading:
                      context.watch<AladinState>().isBestsellerForeignLoading,
                  title: '알라딘 베스트셀러(외국)'),
              _apiForm(
                  onTap: () {
                    context.read<AladinState>().aladinNewBookToFirestoreLogic();
                  },
                  isLoading: context.watch<AladinState>().isNewBookLoading,
                  title: '알라딘 신간'),
              _apiForm(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinSpecialNewBookToFirestoreLogic();
                  },
                  isLoading:
                      context.watch<AladinState>().isSpecialNewBookLoading,
                  title: '알라딘 주목할 만한 신간'),
              _apiForm(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .aladinRecommendBlogToFirestoreLogic();
                  },
                  isLoading:
                      context.watch<AladinState>().isRecommendBlogLoading,
                  title: '블로그 추천'),
              _apiForm(
                  onTap: () {
                    context
                        .read<AladinState>()
                        .recommendEditorAladinISBNReCallKakaoBook();
                  },
                  isLoading:
                      context.watch<AladinState>().isRecommendEditorLoading,
                  title: '에디터 추천(카테고리 별) - 1'),
              // _apiForm(
              //     onTap: () {
              //       context
              //           .read<AladinState>()
              //           .aladinRecommendEditorSecondToFirestoreLogic();
              //     },
              //     isLoading: context
              //         .watch<AladinState>()
              //         .isRecommendEditorSecondLoading,
              //     title: '에디터 추천(카테고리 별) - 2'),
            ],
          ),
        ),
      ),
    );
  }

  Column _apiForm({
    required Function() onTap,
    required bool isLoading,
    required String title,
  }) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.06,
          child: ElevatedButton(
            onPressed: onTap,
            child: isLoading
                ? CircularProgressIndicator(
                    color: appMainColor,
                  )
                : Text(
                    title,
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
          ),
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}
