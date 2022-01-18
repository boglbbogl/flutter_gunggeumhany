import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_api.keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:http/http.dart' as http;

class BookRepo {
  static final BookRepo _bookRepo = BookRepo._internal();
  factory BookRepo() => _bookRepo;
  BookRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Book>> getLocalBookSearch({
    required String query,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _snapshot = await _bookRef
        .where('searchKeyWord', arrayContains: query)
        .limit(100)
        // .where('title', isGreaterThanOrEqualTo: query)
        // .where('title', isLessThanOrEqualTo: "$query+\uf7ff")
        .get();

    final _result = _snapshot.docs.map((e) => Book.fromJson(e.data())).toList()
      ..sort((a, b) => b.starRating!.compareTo(a.starRating!));

    return _result;
  }

  Future<Book> currentBookUpdateItem({
    required String docKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(docKey);
    final _snapshot = await _bookRef.get();
    final _result = Book.fromJson(_snapshot.data()!);
    return _result;
  }

  Future<Book> getNewBookWhereISBNItemNotDocKey({
    required String isbn,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final List<Book> _result = await _bookRef
        .where('isbn', isEqualTo: isbn)
        .get()
        .then(
            (value) => value.docs.map((e) => Book.fromJson(e.data())).toList());
    return _result[0];
  }

  Future<List<Book>> getKakaoBookSearch({
    required String query,
    required int page,
  }) async {
    final uri = Uri.parse(
        "$kakaoApiBaseUrl/search/book?target=title&query=$query&size=50&page=$page");
    final response = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $kakaoApiKey',
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final CollectionReference<Map<String, dynamic>> _bookRef =
          _firestore.collection(collectionBook);
      final List<Book> _localBookData = await _bookRef
          .get()
          .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
      final _batch = _firestore.batch();
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["documents"] as List<dynamic>;
      final _kakaoResult = KakaoBook.fromJson(decoded as Map<String, dynamic>);
      final _kakaoBookData = _documents
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      final List<Book> _setBookData = _kakaoResult.documents;
      if (_setBookData.isNotEmpty) {
        _setBookData.removeWhere((element) =>
            _localBookData.map((e) => e.title).contains(element.title));
        for (int i = 0; i < _setBookData.length; i++) {
          final _id = _bookRef.doc();
          final List<String> _searchKeyWord =
              searchKeywordSplit(book: _setBookData, index: i);
          _batch.set(
              _id,
              _setBookData[i]
                  .copyWith(
                    docKey: _id.id,
                    searchKeyWord: _searchKeyWord,
                    createdAt: DateTime.now(),
                    starUserKey: [],
                    starRating: 0.0,
                    favoriteUserKey: [],
                    favoriteRating: 0.0,
                    bookmarkUserKey: [],
                    isbn8: _setBookData[i].isbn.split(" ")[0],
                    isbn13: _setBookData[i].isbn.split(" ")[1],
                  )
                  .toJson());
        }
        await _batch.commit();
      }
      return _kakaoBookData;
    }
    return [];
  }

  Future<List<Book>> getMoreKakaoSearchBook({
    required String query,
    required int page,
  }) async {
    final uri = Uri.parse(
        "$kakaoApiBaseUrl/search/book?target=title&query=$query&size=50&page=$page");
    final response = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $kakaoApiKey',
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final CollectionReference<Map<String, dynamic>> _bookRef =
          _firestore.collection(collectionBook);
      final List<Book> _localBookData = await _bookRef
          .get()
          .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
      final _batch = _firestore.batch();
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["documents"] as List<dynamic>;
      final _kakaoResult = KakaoBook.fromJson(decoded as Map<String, dynamic>);
      final bool _isEnd = _kakaoResult.meta.isEnd;
      final _kakaoBookData = _documents
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      final List<Book> _setBookData = _kakaoResult.documents;
      if (!_isEnd) {
        if (_setBookData.isNotEmpty) {
          _setBookData.removeWhere((element) =>
              _localBookData.map((e) => e.title).contains(element.title));
          for (int i = 0; i < _setBookData.length; i++) {
            final _id = _bookRef.doc();
            final List<String> _searchKeyWord =
                searchKeywordSplit(book: _setBookData, index: i);
            _batch.set(
                _id,
                _setBookData[i]
                    .copyWith(
                      docKey: _id.id,
                      searchKeyWord: _searchKeyWord,
                      createdAt: DateTime.now(),
                      starUserKey: [],
                      starRating: 0.0,
                      favoriteUserKey: [],
                      favoriteRating: 0.0,
                      bookmarkUserKey: [],
                      isbn8: _setBookData[i].isbn.split(" ")[0],
                      isbn13: _setBookData[i].isbn.split(" ")[1],
                    )
                    .toJson());
          }
          await _batch.commit();
          return _kakaoBookData;
        }
      } else {
        return [];
      }
    }
    return [];
  }
}
