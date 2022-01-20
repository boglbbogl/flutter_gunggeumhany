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
        collectionName: collectionAladinTheme,
        documentName: documentBestseller);
    return _result;
  }

  Future<List<Book>> getFirestoreBestsellerBook() async {
    final _result = await aladinFromFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentBestseller);
    return _result;
  }

  Future bestsellerAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentBestseller,
        queryType: 'Bestseller');
  }

  Future<String> getFirestoreBestsellerForeignCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionAladinTheme,
        documentName: documentBestsellerForeign);
    return _result;
  }

  Future<List<Book>> getFirestoreBestsellerForeignBook() async {
    final _result = await aladinFromFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentBestsellerForeign);
    return _result;
  }

  Future bestsellerForeignAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentBestsellerForeign,
        queryType: "Bestseller",
        searchTarget: "Foreign");
  }

  Future<String> getFirestoreSpecialNewBookCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionAladinTheme,
        documentName: documentSpecialNewBook);
    return _result;
  }

  Future<List<Book>> getFirestoreSpecialNewBook() async {
    final _result = await aladinFromFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentSpecialNewBook);
    return _result;
  }

  Future specialNewBookAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentSpecialNewBook,
        queryType: "ItemNewSpecial");
  }
}
