import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/book/book_price_repo.dart';
import 'package:flutter_gunggeumhany/repository/book/book_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class BookState extends ChangeNotifier {
  final BookRepo _bookRepo = BookRepo();
  final BookPriceRepo _bookPriceRepo = BookPriceRepo();
  AladinPrice _aladinPrice = AladinPrice.empty();
  List<Book> _localBookList = [];
  List<Book> _kakaoBookList = [];
  Book _newBookItem = Book.empty();
  bool _isKakaoSearch = false;
  bool _isKakaoEndPage = false;
  bool _isMoreLoading = false;
  bool _isLocalLoading = false;
  bool _isKakaoLoading = false;
  bool _isCurrentBookItemLoading = false;
  int _currentBookItemIndex = -1;
  int _currentBookListIndex = -1;
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
    int? itemIndex,
    int? listIndex,
    required String ISBN13,
    required String ISBN10,
  }) async {
    if (itemIndex != null && listIndex != null) {
      _currentBookItemIndex = itemIndex;
      _currentBookListIndex = listIndex;
    }
    _isCurrentBookItemLoading = true;
    notifyListeners();
    _newBookItem = await _bookRepo.currentBookUpdateItem(docKey: docKey);
    if (ISBN10 != "" && ISBN13 != "") {
      await _getAladinPriceInfo(ISBN10: ISBN10, ISBN13: ISBN13);
    }
    _isCurrentBookItemLoading = false;
    _currentBookItemIndex = -1;
    _currentBookListIndex = -1;
    notifyListeners();
  }

  Future _getAladinPriceInfo({
    required String ISBN13,
    required String ISBN10,
  }) async {
    _aladinPrice =
        await _bookPriceRepo.getAladinPriceInfo(ISBN13: ISBN13, ISBN10: ISBN10);
    notifyListeners();
  }

  Future getNewBookWhereISBNItemNotDocKey({
    required String isbn,
  }) async {
    final String ISBN10 = isbn.split(" ")[0];
    final String ISBN13 = isbn.split(" ")[1];
    _newBookItem = await _bookRepo.getNewBookWhereISBNItemNotDocKey(isbn: isbn);
    await _getAladinPriceInfo(ISBN13: ISBN13, ISBN10: ISBN10);
    notifyListeners();
  }

  Future openBookPurchaseUrlLauncher({
    required String url,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        enableJavaScript: true,
        universalLinksOnly: true,
      );
    } else {
      throw 'error';
    }
  }

  List<Book> get localBookList => _localBookList;
  List<Book> get kakaoBookList => _kakaoBookList;
  bool get isKakaoSearch => _isKakaoSearch;
  bool get isKakaoEndPage => _isKakaoEndPage;
  bool get isMoreLoading => _isMoreLoading;
  bool get isLocalLoading => _isLocalLoading;
  bool get isKakaoLoading => _isKakaoLoading;
  Book get newBookItem => _newBookItem;
  bool get isCurrentBookItemLoading => _isCurrentBookItemLoading;
  int get currentBookItemIndex => _currentBookItemIndex;
  int get currentBookListIndex => _currentBookListIndex;
  AladinPrice get aladinPrice => _aladinPrice;
}
