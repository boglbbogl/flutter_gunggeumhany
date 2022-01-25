import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/book_repo.dart';

class BookState extends ChangeNotifier {
  final BookRepo _bookRepo = BookRepo();
  List<Book> _localBookList = [];
  List<Book> _kakaoBookList = [];
  Book _newBookItem = Book.empty();
  bool _isKakaoSearch = false;
  bool _isKakaoEndPage = false;
  bool _isMoreLoading = false;
  bool _isLocalLoading = false;
  bool _isKakaoLoading = false;
  bool _isCurrentBookItemLoading = false;
  int _page = 1;
  String _query = "";

  Future getSearchBook({
    required String query,
  }) async {
    _isLocalLoading = true;
    notifyListeners();
    if (query.isNotEmpty) {
      _localBookList = await _bookRepo.getLocalBookSearch(query: query);
      _query = query;
      _isKakaoSearch = false;
      _isKakaoEndPage = false;
      _page = 1;
    }
    _isLocalLoading = false;
    notifyListeners();
  }

  Future getKakaoSearchBook() async {
    _isKakaoLoading = true;
    notifyListeners();
    if (_query.isNotEmpty) {
      _kakaoBookList =
          await _bookRepo.getKakaoBookSearch(query: _query, page: 1);
      _page = 1;
      _isKakaoSearch = true;
      _isKakaoEndPage = false;
    }
    _isKakaoLoading = false;
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
      _isKakaoEndPage = false;
    }
    _isMoreLoading = false;
    notifyListeners();
  }

  Future currentBookUpdateItem({
    required String docKey,
  }) async {
    _isCurrentBookItemLoading = true;
    notifyListeners();
    _newBookItem = await _bookRepo.currentBookUpdateItem(docKey: docKey);
    _isCurrentBookItemLoading = false;

    notifyListeners();
  }

  Future getNewBookWhereISBNItemNotDocKey({
    required String isbn,
  }) async {
    _newBookItem = await _bookRepo.getNewBookWhereISBNItemNotDocKey(isbn: isbn);
    notifyListeners();
  }

  // void getLocalBookDetailItme({
  //   required Book book,
  // }) {
  //   _newBookItem = book;
  //   notifyListeners();
  // }

  List<Book> get localBookList => _localBookList;
  List<Book> get kakaoBookList => _kakaoBookList;
  bool get isKakaoSearch => _isKakaoSearch;
  bool get isKakaoEndPage => _isKakaoEndPage;
  bool get isMoreLoading => _isMoreLoading;
  bool get isLocalLoading => _isLocalLoading;
  bool get isKakaoLoading => _isKakaoLoading;
  Book get newBookItem => _newBookItem;
  bool get isCurrentBookItemLoading => _isCurrentBookItemLoading;
}
