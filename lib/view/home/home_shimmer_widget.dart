import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer homeShimmerWidget() {
  return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(51, 51, 51, 1),
      highlightColor: const Color.fromRGBO(115, 115, 115, 1),
      period: const Duration(milliseconds: 1000),
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: Text(
                    index == 0
                        ? '베스트 셀러'
                        : index == 1
                            ? '궁금하니 추천'
                            : index == 2
                                ? '내가 작성한 리뷰'
                                : index == 3
                                    ? '주목할 만한 신간'
                                    : index == 4
                                        ? '추천 리스트'
                                        : index == 5
                                            ? "리뷰 많은 순"
                                            : index == 6
                                                ? "별점 높은 순"
                                                : index == 7
                                                    ? "최근에 작성된 리뷰"
                                                    : '',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                if (index == 2 || index == 7)
                  SizedBox(
                    height: size.width * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.4,
                              // height: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                            ),
                          );
                        }),
                  )
                else
                  SizedBox(
                    height: size.width * 0.4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.25,
                              // height: size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                            ),
                          );
                        }),
                  )
              ],
            );
          }));
}
