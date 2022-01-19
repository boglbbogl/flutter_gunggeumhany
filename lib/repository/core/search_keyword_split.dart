import 'package:flutter_gunggeumhany/model/book.dart';

List<String> searchKeywordSplit({
  required List<Book> book,
  required int index,
}) {
  final List<String> _titleSplit = book[index].title.split(" ");
  final List<String> _titleSplit2 = book[index].title.split("(");
  final List<String> _titleSplit3 = book[index].title.split(")");
  final List<String> _titleSplit4 = book[index].title.split(".");
  final List<String> _titleSplit5 = book[index].title.split(":");
  final List<String> _titleSplit6 =
      book[index].title.replaceAll(".", " ").split(" ");
  final List<String> _contentsSplit = book[index].contents.split(" ");
  final List<String> _authorAndTranslatorSplit = [];
  for (final element in book[index].authors) {
    final _split = element.split(" ");
    final _split2 = element.split(".");
    _authorAndTranslatorSplit.addAll(_split);
    _authorAndTranslatorSplit.addAll(_split2);
  }
  for (final element in book[index].translators) {
    final _split = element.split(" ");
    final _split2 = element.split(".");
    _authorAndTranslatorSplit.addAll(_split);
    _authorAndTranslatorSplit.addAll(_split2);
  }
  final List<String> _translators = book[index].translators;
  final List<String> _searchKeyWord = _titleSplit +
      _titleSplit2 +
      _titleSplit3 +
      _titleSplit4 +
      _titleSplit5 +
      _titleSplit6 +
      _contentsSplit +
      _translators +
      _authorAndTranslatorSplit;
  return _searchKeyWord;
}
