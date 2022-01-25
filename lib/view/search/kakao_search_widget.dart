import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

Padding kakaoSearchWidget({
  required Book book,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(51, 51, 51, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title.length > 50
                  ? "${book.title.replaceAll(".", " ").substring(0, 50)} ..."
                  : book.title.replaceAll(".", " "),
              style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            const SizedBox(height: 6),
            if (book.authors.isNotEmpty) ...[
              _authorsAndTranslators(
                  list: book.authors.length > 3
                      ? book.authors.sublist(0, 3)
                      : book.authors,
                  title: '지은이'),
            ],
            if (book.translators.isNotEmpty) ...[
              _authorsAndTranslators(
                  list: book.translators.length > 3
                      ? book.translators.sublist(0, 3)
                      : book.translators,
                  title: '옮긴이'),
            ],
            const SizedBox(height: 2),
            DefaultTextStyle(
              style: theme.textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(195, 195, 195, 1),
                fontSize: 10,
              ),
              child: Row(
                children: [
                  Text(book.publisher),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 1,
                      height: 8,
                      color: const Color.fromRGBO(135, 135, 135, 1),
                    ),
                  ),
                  Text(book.datetime.toString().substring(0, 10)),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

DefaultTextStyle _authorsAndTranslators({
  required List<String> list,
  required String title,
}) {
  return DefaultTextStyle(
    style: theme.textTheme.bodyText2!.copyWith(
      color: const Color.fromRGBO(225, 225, 225, 1),
      fontSize: 10,
    ),
    child: Row(
      children: [
        Text(title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 1,
            height: 8,
            color: const Color.fromRGBO(135, 135, 135, 1),
          ),
        ),
        ...list.map((e) => Wrap(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      e,
                    )),
              ],
            )),
      ],
    ),
  );
}
