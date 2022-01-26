import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter_gunggeumhany/model/aladin_price.dart';
import 'package:flutter_gunggeumhany/repository/keys/config_reader.dart';
import 'package:http/http.dart' as http;

class BookPriceRepo {
  static final BookPriceRepo _bookPriceRepo = BookPriceRepo._internal();
  factory BookPriceRepo() => _bookPriceRepo;
  BookPriceRepo._internal();

  static String aladinApiBaseUrl = ConfigReader.getAladinApiBaseUrl();
  static String aladinApiKey = ConfigReader.getAladinApiKey();

  Future<AladinPrice> getAladinPriceInfo({
    required String ISBN13,
    required String ISBN10,
  }) async {
    String _queryType = "";
    String _queryISBN = "";
    if (ISBN13.isNotEmpty) {
      _queryType = "ISBN13";
      _queryISBN = ISBN13;
    } else if (ISBN13.isEmpty && ISBN10.isNotEmpty) {
      _queryType = "ISBN";
      _queryISBN = ISBN10;
    } else {
      return AladinPrice.empty();
    }
    final uri = Uri.parse(
        "$aladinApiBaseUrl/ItemLookUp.aspx?ttbkey=$aladinApiKey&itemIdType=$_queryType&ItemId=$_queryISBN&output=js&Version=20131101&OptResult=usedList,reviewList,ebookList");
    final _response = await http.get(uri);
    if (_response.statusCode == 200) {
      final _decoded = json.decode(utf8.decode(_response.bodyBytes));
      if (_decoded["errorCode"] != 8) {
        final _item = _decoded["item"] as List<dynamic>;
        final _toList = _item
            .map((e) => AladinPrice.fromJson(e as Map<String, dynamic>))
            .toList();
        if (_toList.isNotEmpty) {
          final _result = _toList.firstOrNull;
          return _result!;
        } else {
          return AladinPrice.empty();
        }
      }
    }
    return AladinPrice.empty();
  }
}
