import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/state/auth_state.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/state/review_state.dart';
import 'package:flutter_gunggeumhany/view/review/book_price_info_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_appbar_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_create_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_item_widget.dart';
import 'package:flutter_gunggeumhany/view/review/review_my_item_widget.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatelessWidget {
  final Book? bookItem;
  final AladinPrice? aladinPrice;
  const ReviewPage({
    Key? key,
    required this.bookItem,
    required this.aladinPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book _bookItem = bookItem == null
        ? Provider.of<BookState>(context).newBookItem
        : bookItem!;
    final AladinPrice _aladinPrice = aladinPrice == null
        ? Provider.of<BookState>(context).aladinPrice
        : aladinPrice!;
    final Review? _myReview = _bookItem.reviewUser!
            .where((element) => context
                .watch<AuthState>()
                .userProfile!
                .userKey
                .contains(element.userProfile.userKey))
            .map((e) => e.review)
            .isEmpty
        ? null
        : _bookItem.reviewUser!
            .where((element) => context
                .watch<AuthState>()
                .userProfile!
                .userKey
                .contains(element.userProfile.userKey))
            .map((e) => e.review)
            .firstOrNull!;
    final Review? _createReview =
        context.watch<ReviewState>().myReview ?? _myReview;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(slivers: [
          reviewAppbarWidget(book: _bookItem, context: context),
          bookPriceInfoWidget(
              aladinPrice: _aladinPrice,
              context: context,
              isAdult: _bookItem.isAdult!),
          if (_myReview == null) ...[
            if (_createReview == null)
              reviewCreateWidget(
                  bookTitle: _bookItem.title,
                  authors: _bookItem.authors,
                  context: context,
                  bookDocKey: _bookItem.docKey ?? "")
            else
              reviewMyItemWidget(me: _createReview, context: context),
          ],
          if (_myReview != null) ...[
            reviewMyItemWidget(me: _myReview, context: context),
          ],
          reviewItemWidget(
              userReviewList: _bookItem.reviewUser!, context: context),
        ]),
      ),
    );
  }
}
