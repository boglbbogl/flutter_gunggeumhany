import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer preferenceShimmerWidget() {
  return Shimmer.fromColors(
    baseColor: darkThemeNavyCardColor,
    highlightColor: const Color.fromRGBO(91, 91, 91, 1),
    child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 34),
          ...List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.20,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.width * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.65,
                            height: size.width * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                          ),
                          // const SizedBox(height: 8),
                          Container(
                            width: size.width * 0.45,
                            height: size.width * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                          ),
                          // const SizedBox(height: 8),
                          Container(
                            width: size.width * 0.45,
                            height: size.width * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
