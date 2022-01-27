import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/state/core/logger.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gunggeumhany/repository/keys/config_reader.dart';

class BookNoneRepo {
  static final BookNoneRepo _bookNoneRepo = BookNoneRepo._internal();
  factory BookNoneRepo() => _bookNoneRepo;
  BookNoneRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String aladinApiBaseUrl = ConfigReader.getAladinApiBaseUrl();
  static String aladinApiKey = ConfigReader.getAladinApiKey();

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
    logger.e(_bookList);
    for (final element in _bookList) {
      if (element.isbn13!.isNotEmpty) {
        final _uri = Uri.parse(
            "$aladinApiBaseUrl/ItemLookUp.aspx?ttbkey=$aladinApiKey&itemIdType=ISBN13&ItemId=${element.isbn13}&output=js&Version=20131101&Cover=Big");
        final _response = await http.get(_uri);
        if (_response.statusCode == 200) {
          final decoded = json.decode(utf8.decode(_response.bodyBytes));
          if (decoded["errorCode"] != 8) {
            final _item = decoded["item"] as List<dynamic>;
            final _thumbnail = _item.map((e) => e[aladinParameter]);
            final _thumbnailToString =
                _thumbnail.toString().replaceAll("(", "").replaceAll(")", "");
            final _bookDocRef = _bookRef.doc(element.docKey);
            await _bookDocRef.update({
              updateData: _thumbnailToString,
            });
          }
        }
      }
    }
  }
}
