import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_create_widget.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_appbar_widget.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  final Book book;
  const ReviewPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          reviewAppbarWidget(book: book),
          reviewCreateWidget(context: context),
        ],
      ),
    );
  }
}
