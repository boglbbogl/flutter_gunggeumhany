import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_api.keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewBookRepo {
  static final NewBookRepo _newBookRepo = NewBookRepo._internal();
  factory NewBookRepo() => _newBookRepo;
  NewBookRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> getFirestoreNewBookCreatedAt() async {
    final CollectionReference<Map<String, dynamic>> _newBookRef =
        _firestore.collection(collectionNewBook);
    final _newBookSnapshot =
        await _newBookRef.orderBy("createdAt", descending: true).limit(1).get();
    final _createdAt = _newBookSnapshot.docs
        .map((e) => e.data()["createdAt"] as Timestamp)
        .firstOrNull;
    final _result = DateFormat.yMMMEd().format(_createdAt!.toDate());
    return _result;
  }

  Future<List<Book>> getFirestoreNewBook() async {
    final List<Book> _newBookList = [];
    final CollectionReference<Map<String, dynamic>> _newBookRef =
        _firestore.collection(collectionNewBook);
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _newBookSnapshot =
        await _newBookRef.orderBy("createdAt", descending: true).limit(1).get();
    final _result =
        _newBookSnapshot.docs.map((e) => e.data()["ISBN"]).firstOrNull;
    for (final element in _result) {
      if (element != "") {
        final _bookSnapshot =
            await _bookRef.where("isbn13", isEqualTo: element).get();
        final Book? _bookResult =
            _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).isEmpty
                ? null
                : _bookSnapshot.docs
                    .map((e) => Book.fromJson(e.data()))
                    .firstOrNull!;
        if (_bookResult != null) {
          _newBookList.add(_bookResult);
        }
      }
    }

    return _newBookList;
  }

  Future<List<String>> getAladinNewBookISBN() async {
    final uri = Uri.parse(
        "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=ItemNewAll&MaxResults=50&start=1&SearchTarget=book&output=js&Version=20131101");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["item"] as List<dynamic>;
      final _result = _documents.map((e) => e["isbn13"].toString()).toList();
      final DocumentReference<Map<String, dynamic>> _bestsellerRef = _firestore
          .collection(collectionNewBook)
          .doc(DateTime.now().toString());
      await _bestsellerRef.set({"ISBN": _result, "createdAt": DateTime.now()});
      return _result;
    }
    return [];
  }

  Future newBookAladinISBNReCallKakaoBook({
    required List<String> aladinISBN,
  }) async {
    final List<Book> _aladinNewBookItem = [];
    for (final element in aladinISBN) {
      final uri = Uri.parse(
          "$kakaoApiBaseUrl/search/book?target=title&query=$element&size=50&page=1");
      final response = await http.get(uri, headers: {
        'Authorization': 'KakaoAK $kakaoApiKey',
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        final decoded = json.decode(utf8.decode(response.bodyBytes));
        final KakaoBook _kakaoResult =
            KakaoBook.fromJson(decoded as Map<String, dynamic>);
        final List<Book> _kakaoDocument = _kakaoResult.documents;
        if (_kakaoDocument.isNotEmpty) {
          _aladinNewBookItem.add(_kakaoDocument.firstOrNull!);
        }
      }
    }

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinNewBookItem.isNotEmpty) {
      _aladinNewBookItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinNewBookItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinNewBookItem, index: i);

        _batch.set(
            _id,
            _aladinNewBookItem[i]
                .copyWith(
                  docKey: _id.id,
                  searchKeyWord: _searchKeyWord,
                  createdAt: DateTime.now(),
                  starUserKey: [],
                  starRating: 0.0,
                  favoriteUserKey: [],
                  favoriteRating: 0.0,
                  bookmarkUserKey: [],
                  isbn10: _aladinNewBookItem[i].isbn.split(" ")[0],
                  isbn13: _aladinNewBookItem[i].isbn.split(" ")[1],
                )
                .toJson());
      }
      await _batch.commit();
    }
  }

  Future<String> getFirestoreSpecialNewBookCreatedAt() async {
    final CollectionReference<Map<String, dynamic>> _specialNewBookRef =
        _firestore.collection(collectionSpecialNewBook);
    final _specialNewBookSnapshot = await _specialNewBookRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _createdAt = _specialNewBookSnapshot.docs
        .map((e) => e.data()["createdAt"] as Timestamp)
        .firstOrNull;
    final _result = DateFormat.yMMMEd().format(_createdAt!.toDate());
    return _result;
  }

  Future<List<Book>> getFirestoreSpecialNewBook() async {
    final List<Book> _speicalNewBookList = [];
    final CollectionReference<Map<String, dynamic>> _specialNewBookRef =
        _firestore.collection(collectionSpecialNewBook);
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _specialNewBookSnapshot = await _specialNewBookRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _result =
        _specialNewBookSnapshot.docs.map((e) => e.data()["ISBN"]).firstOrNull;
    for (final element in _result) {
      if (element != "") {
        final _bookSnapshot =
            await _bookRef.where("isbn13", isEqualTo: element).get();
        final Book? _bookResult =
            _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).isEmpty
                ? null
                : _bookSnapshot.docs
                    .map((e) => Book.fromJson(e.data()))
                    .firstOrNull!;
        if (_bookResult != null) {
          _speicalNewBookList.add(_bookResult);
        }
      }
    }

    return _speicalNewBookList;
  }

  Future<List<String>> getAladinSpecialNewBookISBN() async {
    final uri = Uri.parse(
        "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=ItemNewSpecial&MaxResults=25&start=1&SearchTarget=book&output=js&Version=20131101");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["item"] as List<dynamic>;
      final _result = _documents.map((e) => e["isbn13"].toString()).toList();
      final DocumentReference<Map<String, dynamic>> _specialNewBookRef =
          _firestore
              .collection(collectionSpecialNewBook)
              .doc(DateTime.now().toString());
      await _specialNewBookRef
          .set({"ISBN": _result, "createdAt": DateTime.now()});
      return _result;
    }
    return [];
  }

  Future specialNewBookAladinISBNReCallKakaoBook({
    required List<String> aladinISBN,
  }) async {
    final List<Book> _aladinSpecialNewBookItem = [];
    for (final element in aladinISBN) {
      final uri = Uri.parse(
          "$kakaoApiBaseUrl/search/book?target=title&query=$element&size=50&page=1");
      final response = await http.get(uri, headers: {
        'Authorization': 'KakaoAK $kakaoApiKey',
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        final decoded = json.decode(utf8.decode(response.bodyBytes));
        final KakaoBook _kakaoResult =
            KakaoBook.fromJson(decoded as Map<String, dynamic>);
        final List<Book> _kakaoDocument = _kakaoResult.documents;
        if (_kakaoDocument.isNotEmpty) {
          _aladinSpecialNewBookItem.add(_kakaoDocument.firstOrNull!);
        }
      }
    }

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinSpecialNewBookItem.isNotEmpty) {
      _aladinSpecialNewBookItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinSpecialNewBookItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinSpecialNewBookItem, index: i);

        _batch.set(
            _id,
            _aladinSpecialNewBookItem[i]
                .copyWith(
                  docKey: _id.id,
                  searchKeyWord: _searchKeyWord,
                  createdAt: DateTime.now(),
                  starUserKey: [],
                  starRating: 0.0,
                  favoriteUserKey: [],
                  favoriteRating: 0.0,
                  bookmarkUserKey: [],
                  isbn10: _aladinSpecialNewBookItem[i].isbn.split(" ")[0],
                  isbn13: _aladinSpecialNewBookItem[i].isbn.split(" ")[1],
                )
                .toJson());
      }
      await _batch.commit();
    }
  }
}
