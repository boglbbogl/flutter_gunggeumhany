import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/repository/keys/config_reader.dart';
import 'package:flutter_gunggeumhany/state/core/logger.dart';
import 'package:http/http.dart' as http;

class BookNoneRepo {
  static final BookNoneRepo _bookNoneRepo = BookNoneRepo._internal();
  factory BookNoneRepo() => _bookNoneRepo;
  BookNoneRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String aladinApiBaseUrl = ConfigReader.getAladinApiBaseUrl();
  static String aladinApiKey = ConfigReader.getAladinApiKey();
  static String kakaoApiBaseUrl = ConfigReader.getKakaoApiBaseUrl();
  static String kakaoApiKey = ConfigReader.getKakaoApiKey();

  Future noneFieldAddProvderKakao({
    required String updateData,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final List<Book> _bookList =
        await _bookRef.where(updateData, isEqualTo: "").get().then((value) {
      return value.docs.map((e) => Book.fromJson(e.data())).toList();
    });
    logger.e(_bookList);
    for (final element in _bookList) {
      if (element.isbn13!.isNotEmpty) {
        final uri = Uri.parse(
            "$kakaoApiBaseUrl/search/book?target=title&query=${element.isbn13}&size=1&page=1");
        final _response = await http.get(uri, headers: {
          'Authorization': 'KakaoAK $kakaoApiKey',
          "Content-Type": "application/json",
        });
        if (_response.statusCode == 200) {
          final _decoded = json.decode(utf8.decode(_response.bodyBytes));

          // final KakaoBook _kakaoResult =
          //     KakaoBook.fromJson(decoded as Map<String, dynamic>);
          final _kakaoResult = _decoded["documents"] as List<dynamic>;
          if (_kakaoResult.isNotEmpty) {
            final _addUpdateData = _kakaoResult[0][updateData];
            final _bookDocRef = _bookRef.doc(element.docKey);
            await _bookDocRef.update({updateData: _addUpdateData});
          }
        }
      }
    }
  }

  Future noneFieldAddCategoryProviderAladin() async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final List<Book> _bookList = await _bookRef.get().then((value) {
      return value.docs
          .map((e) => Book.fromJson(e.data()))
          .where((element) => element.categoryName == "")
          .toList();
    });
    for (final element in _bookList) {
      if (element.isbn13!.isNotEmpty) {
        final _uri = Uri.parse(
            "$aladinApiBaseUrl/ItemLookUp.aspx?ttbkey=$aladinApiKey&itemIdType=ISBN13&ItemId=${element.isbn13}&output=js&Version=20131101");
        final _response = await http.get(_uri);
        if (_response.statusCode == 200) {
          final _decoded = json.decode(utf8.decode(_response.bodyBytes));
          if (_decoded["errorCode"] != 8) {
            final _item = _decoded["item"] as List<dynamic>;
            final _categoryResult = _item.map((e) => e["categoryName"]);
            if (_categoryResult.isNotEmpty) {
              final _categoryToString = _categoryResult
                  .toString()
                  .replaceAll("(", "")
                  .replaceAll(")", "");
              final _categoryToList = _categoryToString.split(">");
              final _bookDocRef = _bookRef.doc(element.docKey);
              await _bookDocRef.update({
                "categoryName": _categoryToString,
                "categoryList": _categoryToList,
                "searchKeyWord": FieldValue.arrayUnion(_categoryToList),
              });
            }
          }
        }
      }
    }
  }

  Future noneFieldAddAdultProviderAladin() async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final List<Book> _bookList = await _bookRef.get().then((value) {
      return value.docs
          .map((e) => Book.fromJson(e.data()))
          .where((element) => element.isAdult == null)
          .toList();
    });
    for (final element in _bookList) {
      if (element.isbn13!.isNotEmpty) {
        final _uri = Uri.parse(
            "$aladinApiBaseUrl/ItemLookUp.aspx?ttbkey=$aladinApiKey&itemIdType=ISBN13&ItemId=${element.isbn13}&output=js&Version=20131101");
        final _response = await http.get(_uri);
        if (_response.statusCode == 200) {
          final _decoded = json.decode(utf8.decode(_response.bodyBytes));
          if (_decoded["errorCode"] != 8) {
            final _item = _decoded["item"] as List<dynamic>;
            final _isAdultResult = _item.map((e) => e["adult"]);
            logger.e(_isAdultResult);
            if (_isAdultResult.isNotEmpty) {
              final _isAdultToString = _isAdultResult
                  .toString()
                  .replaceAll("(", "")
                  .replaceAll(")", "");
              bool? _setIsAdult;
              if (_isAdultToString == "true") {
                _setIsAdult = true;
              } else {
                _setIsAdult = false;
              }
              final _bookDocRef = _bookRef.doc(element.docKey);
              await _bookDocRef.update({
                "isAdult": _setIsAdult,
              });
            }
          }
        }
      }
    }
  }

  Future noneFieldAddProviderAladin({
    required String updateData,
    required String aladinParameter,
  }) async {
    final CollectionReference<Map<String, dynamic>> _bookRef =
        _firestore.collection(collectionBook);
    final List<Book> _bookList =
        await _bookRef.where(updateData, isEqualTo: "").get().then((value) {
      return value.docs.map((e) => Book.fromJson(e.data())).toList();
    });
    for (final element in _bookList) {
      if (element.isbn13!.isNotEmpty) {
        final _uri = Uri.parse(
            "$aladinApiBaseUrl/ItemLookUp.aspx?ttbkey=$aladinApiKey&itemIdType=ISBN13&ItemId=${element.isbn13}&output=js&Version=20131101&Cover=Big");
        final _response = await http.get(_uri);
        if (_response.statusCode == 200) {
          final decoded = json.decode(utf8.decode(_response.bodyBytes));
          if (decoded["errorCode"] != 8) {
            final _item = decoded["item"] as List<dynamic>;
            final _parameterResult = _item.map((e) => e[aladinParameter]);
            final _parameterResultString = _parameterResult
                .toString()
                .replaceAll("(", "")
                .replaceAll(")", "");
            final _bookDocRef = _bookRef.doc(element.docKey);
            await _bookDocRef.update({
              updateData: _parameterResultString,
            });
          }
        }
      }
    }
  }
}
