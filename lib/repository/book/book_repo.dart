import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/review_user.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/config_reader.dart';
import 'package:flutter_gunggeumhany/state/core/logger.dart';
import 'package:http/http.dart' as http;

class BookRepo {
  static final BookRepo _bookRepo = BookRepo._internal();
  factory BookRepo() => _bookRepo;
  BookRepo._internal();

  static String apiBaseUrl = ConfigReader.getKakaoApiBaseUrl();
  static String apiKey = ConfigReader.getKakaoApiKey();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Book>> getLocalBookSearch({
    required String query,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _bookSnapshot = await _bookRef
        .where('searchKeyWord', arrayContains: query)
        .limit(100)
        .get();

    final List<Book> _bookResult =
        _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).toList()
          ..shuffle()
          ..sort((a, b) => b.starRating!.compareTo(a.starRating!));

    return _bookResult;
  }

  Future<Book> currentBookUpdateItem({
    required String docKey,
  }) async {
    final List<ReviewUser> _reviewUser = [];
    final DocumentReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook).doc(docKey);
    final _snapshot = await _bookRef.get();
    final _result = Book.fromJson(_snapshot.data()!);
    final CollectionReference<Map<String, dynamic>> _reviewRef = _firestore
        .collection(collectionBook)
        .doc(_result.docKey)
        .collection(collectionReview);
    final _reviewSnapshot = await _reviewRef.get();
    final List<Review> _reviewList =
        _reviewSnapshot.docs.map((e) => Review.fromJson(e.data())).toList();
    if (_reviewList.isNotEmpty) {
      for (final element in _reviewList) {
        final DocumentReference<Map<String, dynamic>> _userRef =
            _firestore.collection(collectionUserProfile).doc(element.userKey);
        final _userSnapshot = await _userRef.get();
        final UserProfile _userProfile =
            UserProfile.fromJson(_userSnapshot.data()!);
        _reviewUser.add(ReviewUser(review: element, userProfile: _userProfile));
        _result.copyWith(reviewUser: _reviewUser);
      }
    }
    logger.e(_result.docKey);
    return _result.copyWith(reviewUser: _reviewUser);
  }

  Future<Book> getNewBookWhereISBNItemNotDocKey({
    required String isbn,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    logger.e(isbn);
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
        "$apiBaseUrl/search/book?target=title&query=$query&size=50&page=$page");
    final response = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $apiKey',
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
      for (final element in _documents) {
        final _null = element["datetime"];
        if (_null == "") {
          return [];
        }
      }
      final _kakaoResult = KakaoBook.fromJson(decoded as Map<String, dynamic>);
      final _kakaoBookData = _documents
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      final List<Book> _setBookData = _kakaoResult.documents;
      if (_setBookData.isNotEmpty) {
        _setBookData.removeWhere((element) =>
            _localBookData
                .map((e) => e.isbn13)
                .contains(element.isbn.split(" ")[1]) ||
            _localBookData
                .map((e) => e.isbn10)
                .contains(element.isbn.split(" ")[0]) ||
            _localBookData.map((e) => e.isbn).contains(element.isbn));

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
                    lastReviewCreatedAt: newBookReviewDateFormat(),
                    starUserKey: [],
                    starRating: 0.0,
                    favoriteUserKey: [],
                    favoriteRating: 0.0,
                    bookmarkUserKey: [],
                    isbn10: _setBookData[i].isbn.split(" ")[0],
                    isbn13: _setBookData[i].isbn.split(" ")[1],
                    isAdult: null,
                    categoryList: [],
                    categoryName: "",
                    reviewUser: [],
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
        "$apiBaseUrl/search/book?target=title&query=$query&size=50&page=$page");
    final response = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $apiKey',
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
      for (final element in _documents) {
        final _null = element["datetime"];
        if (_null == "") {
          return [];
        }
      }
      final _kakaoResult = KakaoBook.fromJson(decoded as Map<String, dynamic>);
      final bool _isEnd = _kakaoResult.meta.isEnd;
      final _kakaoBookData = _documents
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      final List<Book> _setBookData = _kakaoResult.documents;
      if (!_isEnd) {
        if (_setBookData.isNotEmpty) {
          _setBookData.removeWhere((element) =>
              _localBookData
                  .map((e) => e.isbn13)
                  .contains(element.isbn.split(" ")[1]) ||
              _localBookData
                  .map((e) => e.isbn10)
                  .contains(element.isbn.split(" ")[0]) ||
              _localBookData.map((e) => e.isbn).contains(element.isbn));
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
                      lastReviewCreatedAt: newBookReviewDateFormat(),
                      starUserKey: [],
                      starRating: 0.0,
                      favoriteUserKey: [],
                      favoriteRating: 0.0,
                      bookmarkUserKey: [],
                      isbn10: _setBookData[i].isbn.split(" ")[0],
                      isbn13: _setBookData[i].isbn.split(" ")[1],
                      isAdult: null,
                      categoryName: "",
                      categoryList: [],
                      reviewUser: [],
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
