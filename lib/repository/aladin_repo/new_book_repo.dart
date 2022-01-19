import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_from_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_to_firestore.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class NewBookRepo {
  static final NewBookRepo _newBookRepo = NewBookRepo._internal();
  factory NewBookRepo() => _newBookRepo;
  NewBookRepo._internal();

  Future<String> getFirestoreNewBookCreatedAt() async {
    final _result =
        await aladinFromFirestoreCreatedAt(collectionName: collectionNewBook);
    return _result;
  }

  Future<List<Book>> getFirestoreNewBook() async {
    final _result =
        await aladinFromFirestore(collectionName: collectionNewBook);
    return _result;
  }

  Future newBookAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionNewBook, queryType: "ItemNewAll");
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
