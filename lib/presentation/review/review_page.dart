import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/presentation/review/book_price_info_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_create_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_item_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_my_item_widget.dart';
import 'package:flutter_gunggeumhany/service/book_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatelessWidget {
  final Book? bookItem;
  const ReviewPage({
    Key? key,
    required this.bookItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book _bookItem = bookItem == null
        ? Provider.of<BookState>(context).newBookItem
        : bookItem!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            reviewAppbarWidget(book: _bookItem, context: context),
            if (context.watch<ReviewState>().aladinPrice != null) ...[
              bookPriceInfoWidget(
                  aladinPrice: context.watch<ReviewState>().aladinPrice!),
            ],
            if (!context.watch<ReviewState>().isGetReviewListLoading) ...[
              if (context.watch<ReviewState>().myReview == null) ...[
                reviewCreateWidget(
                    bookTitle: _bookItem.title,
                    authors: _bookItem.authors,
                    context: context,
                    bookDocKey: _bookItem.docKey ?? ""),
              ],
              if (context.watch<ReviewState>().myReview != null) ...[
                reviewMyItemWidget(
                    me: context.watch<ReviewState>().myReview!,
                    context: context),
              ],
              reviewItemWidget(),
            ],
            if (context.watch<ReviewState>().isGetReviewListLoading) ...[
              SliverList(
                  delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(child: CircularProgressIndicator()),
                )
              ]))
            ],
          ],
        ),
      ),
    );
  }
}
