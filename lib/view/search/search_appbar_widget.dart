import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/state/book_state.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';
import 'package:provider/provider.dart';

Row searchAppbarWidget({
  required BuildContext context,
  required bool isLocalLoading,
}) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded)),
      SizedBox(
          width: size.width * 0.7,
          height: size.height * 0.04,
          child: TextFormField(
            onFieldSubmitted: (value) {
              context.read<BookState>().getSearchBook(query: value);
              FocusScope.of(context).unfocus();
            },
            style: theme.textTheme.bodyText2!
                .copyWith(color: Colors.white, fontSize: 10),
            decoration: const InputDecoration(hintText: ' 검색어를 입력해 주세요'),
          )),
      if (isLocalLoading) ...[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: appMainColor,
            ),
          ),
        )
      ],
    ],
  );
}
