import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer searchShimmerLoadingWidget({
  required double width,
  required double height,
}) {
  return Shimmer.fromColors(
    baseColor: Colors.black54,
    highlightColor: Colors.white54,
    period: const Duration(milliseconds: 500),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
      ),
    ),
  );
}
