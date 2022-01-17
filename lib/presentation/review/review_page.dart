import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_appbar_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_create_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_item_widget.dart';
import 'package:flutter_gunggeumhany/presentation/review/review_my_item_widget.dart';
import 'package:flutter_gunggeumhany/service/book_state.dart';
import 'package:flutter_gunggeumhany/service/review_state.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book _bookItem = Provider.of<BookState>(context).newBookItem;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            reviewAppbarWidget(book: _bookItem, context: context),
            if (context.watch<ReviewState>().myReview == null) ...[
              reviewCreateWidget(
                  context: context, bookDocKey: _bookItem.docKey ?? ""),
            ],
            if (context.watch<ReviewState>().myReview != null) ...[
              reviewMyItemWidget(
                  me: context.watch<ReviewState>().myReview!, context: context),
            ],
            reviewItemWidget(),
          ],
        ),
      ),
    );
  }
}
