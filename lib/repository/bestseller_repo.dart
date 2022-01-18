import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_api.keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';
import 'package:http/http.dart' as http;

class BestsellerRepo {
  static final BestsellerRepo _bestsellerRepo = BestsellerRepo._internal();
  factory BestsellerRepo() => _bestsellerRepo;
  BestsellerRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Book>> getFirestoreBestsellerBook() async {
    final List<Book> _bestsellerList = [];
    final CollectionReference<Map<String, dynamic>> _bestsellerRef =
        _firestore.collection(collectionBestseller);
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _bestsellerSnapshot = await _bestsellerRef
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();
    final _result = _bestsellerSnapshot.docs.map((e) => e.data()["ISBN"]).first;
    for (final element in _result) {
      if (element != "") {
        final _bookSnapshot =
            await _bookRef.where("isbn13", isEqualTo: element).get();
        final Book _bookResult =
            _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).isEmpty
                ? Book.empty()
                : _bookSnapshot.docs.map((e) => Book.fromJson(e.data())).first;
        _bestsellerList.add(_bookResult);
      }
    }

    return _bestsellerList;
  }

  Future<List<String>> getAladinBestsellerISBN() async {
    final uri = Uri.parse(
        "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=Bestseller&MaxResults=20&start=1&SearchTarget=book&output=js&Version=20131101");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final _documents = decoded["item"] as List<dynamic>;
      final _result = _documents.map((e) => e["isbn13"].toString()).toList();
      final DocumentReference<Map<String, dynamic>> _bestsellerRef = _firestore
          .collection(collectionBestseller)
          .doc(DateTime.now().toString());
      await _bestsellerRef.set({"ISBN": _result, "createdAt": DateTime.now()});
      return _result;
    }
    return [];
  }

  Future bestsellerAladinISBNReCallKakaoBook({
    required List<String> aladinISBN,
  }) async {
    final List<Book> _aladinBestsellerItem = [];
    for (final element in aladinISBN) {
      final uri = Uri.parse(
          "$kakaoApiBaseUrl/search/book?target=title&query=$element&size=50&page=1");
      final response = await http.get(uri, headers: {
        'Authorization': 'KakaoAK $kakaoApiKey',
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        final decoded = json.decode(utf8.decode(response.bodyBytes));
        final _kakaoResult =
            KakaoBook.fromJson(decoded as Map<String, dynamic>);
        _aladinBestsellerItem.add(_kakaoResult.documents.first);
      }
    }
    logger.d(_aladinBestsellerItem);

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinBestsellerItem.isNotEmpty) {
      _aladinBestsellerItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinBestsellerItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinBestsellerItem, index: i);

        _batch.set(
            _id,
            _aladinBestsellerItem[i]
                .copyWith(
                  docKey: _id.id,
                  searchKeyWord: _searchKeyWord,
                  createdAt: DateTime.now(),
                  starUserKey: [],
                  starRating: 0.0,
                  favoriteUserKey: [],
                  favoriteRating: 0.0,
                  bookmarkUserKey: [],
                  isbn8: _aladinBestsellerItem[i].isbn.split(" ")[0],
                  isbn13: _aladinBestsellerItem[i].isbn.split(" ")[1],
                )
                .toJson());
      }
      await _batch.commit();
    }
  }
}
