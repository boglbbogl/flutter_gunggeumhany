import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/book_repo.dart';

class BookState extends ChangeNotifier {
  final BookRepo _bookRepo = BookRepo();
  List<Book> _localBookList = [];
  List<Book> _kakaoBookList = [];
  bool _isKakaoSearch = false;
  bool _isKakaoEndPage = false;
  bool _isMoreLoading = false;
  int _page = 1;
  String _query = "";

  Future getSearchBook({
    required String query,
  }) async {
    _localBookList = await _bookRepo.getLocalBookSearch(query: query);
    _query = query;
    _isKakaoSearch = false;
    _page = 1;
    notifyListeners();
  }

  Future getKakaoSearchBook() async {
    _kakaoBookList = await _bookRepo.getKakaoBookSearch(query: _query, page: 1);
    _page = 1;
    _isKakaoSearch = true;
    notifyListeners();
  }

  Future getMoreKakaoSearchBook() async {
    _isMoreLoading = true;
    notifyListeners();
    final List<Book> _moreList =
        await _bookRepo.getMoreKakaoSearchBook(query: _query, page: _page + 1);
    if (_moreList.isEmpty) {
      _isKakaoEndPage = true;
    } else {
      _kakaoBookList.addAll(_moreList);
      _page = _page + 1;
    }
    _isMoreLoading = false;
    notifyListeners();
  }

  List<Book> get localBookList => _localBookList;
  List<Book> get kakaoBookList => _kakaoBookList;
  bool get isKakaoSearch => _isKakaoSearch;
  bool get isKakaoEndPage => _isKakaoEndPage;
  bool get isMoreLoading => _isMoreLoading;
}
