import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_from_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_to_firestore.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class BestsellerRepo {
  static final BestsellerRepo _bestsellerRepo = BestsellerRepo._internal();
  factory BestsellerRepo() => _bestsellerRepo;
  BestsellerRepo._internal();

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
}
