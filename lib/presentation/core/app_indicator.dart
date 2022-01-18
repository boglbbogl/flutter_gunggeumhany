import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';

Center appIndicator() {
  return Center(
      child: CircularProgressIndicator(
    color: appMainColor,
  ));
}
