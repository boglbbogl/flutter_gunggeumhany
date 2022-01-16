import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/constant/app_color.dart';
import 'package:flutter_gunggeumhany/model/book.dart';

Padding searchItemWidget({
  required Book book,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(51, 51, 51, 1),
          border: Border.all(color: const Color.fromRGBO(71, 71, 71, 1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title.length > 40
                  ? "${book.title.substring(0, 40)} ..."
                  : book.title,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(height: 6),
            _authorsAndTranslators(list: book.authors, title: '지은이'),
            _authorsAndTranslators(list: book.translators, title: '옮긴이'),
            const SizedBox(height: 2),
            DefaultTextStyle(
              style: theme.textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(195, 195, 195, 1),
                fontSize: 11,
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
      fontSize: 12,
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
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
