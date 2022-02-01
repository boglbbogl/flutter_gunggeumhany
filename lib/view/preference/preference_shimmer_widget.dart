import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer preferenceShimmerWidget() {
  return Shimmer.fromColors(
    baseColor: darkThemeNavyCardColor,
    highlightColor: const Color.fromRGBO(91, 91, 91, 1),
    child: Column(
      children: [
        ...List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Container(
              width: size.width,
              height: size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
