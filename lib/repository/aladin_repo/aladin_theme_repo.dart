import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_from_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_to_firestore.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class AladinThemeRepo {
  static final AladinThemeRepo _aladinThemeRepo = AladinThemeRepo._internal();
  factory AladinThemeRepo() => _aladinThemeRepo;
  AladinThemeRepo._internal();

  Future<String> getFirestoreBestsellerCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionBestseller);
    return _result;
  }

  Future<List<Book>> getFirestoreBestsellerBook() async {
    final _result =
        await aladinFromFirestore(collectionName: collectionBestseller);
    return _result;
  }

  Future bestsellerAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionBestseller, queryType: 'Bestseller');
  }

  Future<String> getFirestoreBestsellerForeignCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionBestsellerForeign);
    return _result;
  }

  Future<List<Book>> getFirestoreBestsellerForeignBook() async {
    final _result =
        await aladinFromFirestore(collectionName: collectionBestsellerForeign);
    return _result;
  }

  Future bestsellerForeignAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionBestsellerForeign,
        queryType: "Bestseller",
        searchTarget: "Foreign");
  }

  Future<String> getFirestoreSpecialNewBookCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionSpecialNewBook);
    return _result;
  }

  Future<List<Book>> getFirestoreSpecialNewBook() async {
    final _result =
        await aladinFromFirestore(collectionName: collectionSpecialNewBook);
    return _result;
  }

  Future specialNewBookAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionSpecialNewBook, queryType: "ItemNewSpecial");
  }
}
