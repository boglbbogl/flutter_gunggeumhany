import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/setting_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

class CustomerServiceListPage extends StatelessWidget {
  const CustomerServiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watch<SettingState>().customerServiceList.isEmpty
          ? Center(
              child: Text(
              '접수 내역이 없습니다',
              style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(215, 215, 215, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ))
          : ListView(
              shrinkWrap: true,
              children: [
                ...context.watch<SettingState>().customerServiceList.map((e) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(71, 71, 71, 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      e.category == "Complain"
                                          ? '불편 신고 요청'
                                          : "개선 사항 요청",
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: e.category == "Complain"
                                                  ? appSubColor
                                                  : appMainColor)),
                                  Text(e.isComment ? '답변완료' : "미답변",
                                      style:
                                          theme.textTheme.bodyText2!.copyWith(
                                        color: e.isComment
                                            ? const Color.fromRGBO(
                                                195, 195, 195, 1)
                                            : e.category == 'Complain'
                                                ? appSubColor
                                                : appMainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: e.isComment ? 10 : 12,
                                      ))
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('"${e.content}"',
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: e.isComment
                                          ? const Color.fromRGBO(
                                              195, 195, 195, 1)
                                          : Colors.white,
                                      fontSize: 12)),
                              const SizedBox(height: 8),
                              Text(e.createdAt.toString().substring(0, 10),
                                  style: theme.textTheme.bodyText2!.copyWith(
                                    color:
                                        const Color.fromRGBO(195, 195, 195, 1),
                                    fontSize: 10,
                                  )),
                              if (e.isComment) ...[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    width: size.width,
                                    height: 0.5,
                                    color: const Color.fromRGBO(91, 91, 91, 1),
                                  ),
                                ),
                                Text(
                                  e.comment,
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    e.commentCreatedAt
                                        .toString()
                                        .substring(0, 10),
                                    style: theme.textTheme.bodyText2!.copyWith(
                                      color: const Color.fromRGBO(
                                          195, 195, 195, 1),
                                      fontSize: 10,
                                    )),
                              ],
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
    );
  }
}
