import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Padding itemLoadingShimmerWidget({
  required double width,
  required double height,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      baseColor: Colors.black87,
      highlightColor: Colors.white38,
      period: const Duration(milliseconds: 1000),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
