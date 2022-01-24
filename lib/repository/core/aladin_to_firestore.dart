import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/kakao_book.dart';
import 'package:flutter_gunggeumhany/repository/core/search_keyword_split.dart';
import 'package:flutter_gunggeumhany/repository/keys/_api.keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/config_reader.dart';
import 'package:http/http.dart' as http;

Future aladinToFirestore({
  required String collectionName,
  required String documentName,
  required String queryType,
  String? searchTarget = "book",
  String? categoryId,
}) async {
  final String aladinApiBaseUrl = ConfigReader.getAladinApiBaseUrl();
  final String aladinApiKey = ConfigReader.getAladinApiKey();
  final String kakaoApiBaseUrl = ConfigReader.getKakaoApiBaseUrl();
  final String kakaoApiKey = ConfigReader.getKakaoApiKey();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Book> _aladinItem = [];
  List<String> _aladinISNB = [];
  final List<String> _removeISBN = [];

  final uri = Uri.parse(categoryId == null
      ? "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=$queryType&MaxResults=50&start=1&SearchTarget=$searchTarget&output=js&Version=20131101"
      : "$aladinApiBaseUrl/ItemList.aspx?ttbkey=$aladinApiKey&QueryType=ItemEditorChoice&MaxResults=50&start=1&output=js&Version=20131101&CategoryId=$categoryId");
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final decoded = json.decode(utf8.decode(response.bodyBytes));
    final _documents = decoded["item"] as List<dynamic>;
    final _result = _documents.map((e) => e["isbn13"].toString()).toList();

    _aladinISNB = _result.where((element) => element != "").toList();

    for (final element in _aladinISNB) {
      final uri = Uri.parse(
          "$kakaoApiBaseUrl/search/book?target=title&query=$element&size=1&page=1");
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
          if (_kakaoDocument.firstOrNull!.thumbnail.isEmpty) {
            _removeISBN.add(element);
          }
          _aladinItem.add(_kakaoDocument.firstOrNull!);
        } else if (_kakaoDocument.isEmpty) {
          _removeISBN.add(element);
        }
      }
    }
    _aladinISNB.removeWhere((element) => _removeISBN.contains(element));
    final List<String> _toFirestoreISBN =
        _aladinISNB.length > 15 ? _aladinISNB.sublist(0, 15) : _aladinISNB;
    final DocumentReference<Map<String, dynamic>> _aladinRef = _firestore
        .collection(collectionName)
        .doc(documentName)
        .collection(documentName)
        .doc(DateTime.now().toString());
    await _aladinRef
        .set({"ISBN": _toFirestoreISBN, "createdAt": DateTime.now()});

    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final _batch = _firestore.batch();
    final List<Book> _localBookData = await _bookRef
        .get()
        .then((sn) => sn.docs.map((e) => Book.fromJson(e.data())).toList());
    if (_aladinItem.isNotEmpty) {
      _aladinItem.removeWhere((element) =>
          _localBookData.map((e) => e.title).contains(element.title));
      for (int i = 0; i < _aladinItem.length; i++) {
        final _id = _bookRef.doc();
        final List<String> _searchKeyWord =
            searchKeywordSplit(book: _aladinItem, index: i);

        _batch.set(
            _id,
            _aladinItem[i]
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
                  isbn10: _aladinItem[i].isbn.split(" ")[0],
                  isbn13: _aladinItem[i].isbn.split(" ")[1],
                  isAudlt: false,
                )
                .toJson());
      }
      await _batch.commit();
    }
  }
}
