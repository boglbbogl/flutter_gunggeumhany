import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/aladin_editor_category.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_api.keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RecommendBookRepo {
  static final RecommendBookRepo _recommendBookRepo =
      RecommendBookRepo._internal();
  factory RecommendBookRepo() => _recommendBookRepo;
  RecommendBookRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getFirestoreRecommendBlogCreatedAt() async {
    final CollectionReference<Map<String, dynamic>> _recommendBlogRef =
        _firestore.collection(collectionRecommendBlog);
    final _recommendBlogSnapshot = await _recommendBlogRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _createdAt = _recommendBlogSnapshot.docs
        .map((e) => e.data()["createdAt"] as Timestamp)
        .firstOrNull;
    final _result = _createdAt != null
        ? DateFormat.yMMMEd().format(_createdAt.toDate())
        : "";

    return _result;
  }

  Future<List<Book>> getFirestoreRecommendBlogBook() async {
    final List<Book> _recommendBlogList = [];
    final CollectionReference<Map<String, dynamic>> _recommendBlogRef =
        _firestore.collection(collectionRecommendBlog);
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _recommendBloSnapshot = await _recommendBlogRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _result =
        _recommendBloSnapshot.docs.map((e) => e.data()["ISBN"]).firstOrNull;
    if (_result != null) {
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
            _recommendBlogList.add(_bookResult);
          }
        }
      }

      return _recommendBlogList;
    }
    return [];
  }

  Future<List<String>> getAladinRecommendBlogISBN() async {
    final uri = Uri.parse(
        "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=BlogBest&MaxResults=50&start=1&SearchTarget=book&output=js&Version=20131101");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["item"] as List<dynamic>;
      final _result = _documents.map((e) => e["isbn13"].toString()).toList();
      final DocumentReference<Map<String, dynamic>> _recommendBlogRef =
          _firestore
              .collection(collectionRecommendBlog)
              .doc(DateTime.now().toString());
      await _recommendBlogRef
          .set({"ISBN": _result, "createdAt": DateTime.now()});
      return _result;
    }
    return [];
  }

  Future recommendBlogAladinISBNReCallKakaoBook({
    required List<String> aladinISBN,
  }) async {
    final List<Book> _aladinRecommendBlogItem = [];
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
          _aladinRecommendBlogItem.add(_kakaoDocument.firstOrNull!);
        }
      }
    }

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinRecommendBlogItem.isNotEmpty) {
      _aladinRecommendBlogItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinRecommendBlogItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinRecommendBlogItem, index: i);

        _batch.set(
            _id,
            _aladinRecommendBlogItem[i]
                .copyWith(
                  docKey: _id.id,
                  searchKeyWord: _searchKeyWord,
                  createdAt: DateTime.now(),
                  starUserKey: [],
                  starRating: 0.0,
                  favoriteUserKey: [],
                  favoriteRating: 0.0,
                  bookmarkUserKey: [],
                  isbn10: _aladinRecommendBlogItem[i].isbn.split(" ")[0],
                  isbn13: _aladinRecommendBlogItem[i].isbn.split(" ")[1],
                )
                .toJson());
      }
      await _batch.commit();
    }
  }

  Future<List<String>> getAladinRecommendEidtorISBN({
    required List<AladinEditorCategory> category,
  }) async {
    final List<String> _addISBN = [];
    for (int i = 0; i < category.length; i++) {
      final uri = Uri.parse(
          "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=ItemEditorChoice&MaxResults=50&start=1&output=js&Version=20131101&CategoryId=${category[i].categoryId}");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decoded = json.decode(utf8.decode(response.bodyBytes));
        final _documents = decoded["item"] as List<dynamic>;
        final _result = _documents.map((e) => e["isbn13"].toString()).toList();
        final DocumentReference<Map<String, dynamic>> _recommendEidtorRef =
            _firestore
                .collection(collectionRecommendEditor)
                .doc(category[i].collectionName)
                .collection(category[i].collectionName)
                .doc(DateTime.now().toString());
        await _recommendEidtorRef
            .set({"ISBN": _result, "createdAt": DateTime.now()});
        for (final element in _result) {
          _addISBN.add(element);
        }
        // return _addISBN;
      }
    }
    return _addISBN;
  }

  Future recommendEditorAladinISBNReCallKakaoBook({
    required List<String> aladinISBN,
  }) async {
    final List<Book> _aladinRecommendEditorItem = [];
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
          _aladinRecommendEditorItem.add(_kakaoDocument.firstOrNull!);
        }
      }
    }

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinRecommendEditorItem.isNotEmpty) {
      _aladinRecommendEditorItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinRecommendEditorItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinRecommendEditorItem, index: i);

        _batch.set(
            _id,
            _aladinRecommendEditorItem[i]
                .copyWith(
                  docKey: _id.id,
                  searchKeyWord: _searchKeyWord,
                  createdAt: DateTime.now(),
                  starUserKey: [],
                  starRating: 0.0,
                  favoriteUserKey: [],
                  favoriteRating: 0.0,
                  bookmarkUserKey: [],
                  isbn10: _aladinRecommendEditorItem[i].isbn.split(" ")[0],
                  isbn13: _aladinRecommendEditorItem[i].isbn.split(" ")[1],
                )
                .toJson());
      }
      await _batch.commit();
    }
  }

  // Firestore get

  Future<String> getFirestoreRecommendEditorCreatedAt() async {
    final CollectionReference<Map<String, dynamic>> _recommendEditorRef =
        _firestore
            .collection(collectionRecommendEditor)
            .doc(documentEditorMystery)
            .collection(documentEditorMystery);
    final _recommendEditorSnapshot = await _recommendEditorRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _createdAt = _recommendEditorSnapshot.docs
        .map((e) => e.data()["createdAt"] as Timestamp)
        .firstOrNull;
    final _result = _createdAt != null
        ? DateFormat.yMMMEd().format(_createdAt.toDate())
        : "";

    return _result;
  }

  Future<List<Book>> getFirestoreRecommendEditorBook({
    required String documentId,
  }) async {
    final List<Book> _recommendEditorist = [];
    final CollectionReference<Map<String, dynamic>> _recommendEditorRef =
        _firestore
            .collection(collectionRecommendEditor)
            .doc(documentId)
            .collection(documentId);
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _recommendEditorSnapshot = await _recommendEditorRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _result =
        _recommendEditorSnapshot.docs.map((e) => e.data()["ISBN"]).firstOrNull;
    if (_result != null) {
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
            _recommendEditorist.add(_bookResult);
          }
        }
      }

      return _recommendEditorist;
    }
    return [];
  }
}
