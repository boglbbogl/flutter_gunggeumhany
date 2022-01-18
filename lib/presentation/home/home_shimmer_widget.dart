import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer homeShimmerWidget() {
  return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(51, 51, 51, 1),
      highlightColor: const Color.fromRGBO(115, 115, 115, 1),
      period: const Duration(milliseconds: 1000),
      child: ListView.builder(
          itemCount: 5,
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
                            ? '주목할 만한 신간'
                            : index == 2
                                ? '추천 리스트'
                                : index == 3
                                    ? '베스트 셀러 (외국)'
                                    : index == 4
                                        ? '신간'
                                        : '',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
