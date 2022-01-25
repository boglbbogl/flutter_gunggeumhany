import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

Center appIndicator() {
  return Center(
      child: CircularProgressIndicator(
    color: appMainColor,
  ));
}
