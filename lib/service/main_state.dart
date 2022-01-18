import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/bestseller_repo.dart';
import 'package:flutter_gunggeumhany/repository/new_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/recommend_book_repo.dart';

class MainState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();
  final NewBookRepo _newBookRepo = NewBookRepo();
  final RecommendBookRepo _recommendBookRepo = RecommendBookRepo();
  List<Book> _bestsellerList = [];
  String _bestsellerCreatedAt = "";
  List<Book> _newBookList = [];
  String _newBookCreatedAt = "";
  List<Book> _specialNewBookList = [];
  String _specialNewBookCreatedAt = "";
  List<Book> _recommendBlogList = [];
  String _recommendBlogCreatedAt = "";
  List<Book> _bestsellerForeignList = [];
  String _bestsellerForeignCreatedAt = "";

  // Future<void> started() async {
  //   await _getFirestoreBestsellerBookItem();
  //    _getFirestoreSpecialNewBookItem();
  //   _getFirestoreRecommendBlogBookItem();
  //   _getFirestoreBestsellerForeignBookItem();
  //   _getFirestoreNewBookItem();

  //   notifyListeners();
  // }

  MainState() {
    _getFirestoreBestsellerBookItem();
    _getFirestoreSpecialNewBookItem();
    _getFirestoreRecommendBlogBookItem();
    _getFirestoreBestsellerForeignBookItem();
    _getFirestoreNewBookItem();
  }

  Future _getFirestoreRecommendBlogBookItem() async {
    _recommendBlogList =
        await _recommendBookRepo.getFirestoreRecommendBlogBook();
    _recommendBlogCreatedAt =
        await _recommendBookRepo.getFirestoreRecommendBlogCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreSpecialNewBookItem() async {
    _specialNewBookList = await _newBookRepo.getFirestoreSpecialNewBook();
    _specialNewBookCreatedAt =
        await _newBookRepo.getFirestoreSpecialNewBookCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreNewBookItem() async {
    _newBookList = await _newBookRepo.getFirestoreNewBook();
    _newBookCreatedAt = await _newBookRepo.getFirestoreNewBookCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreBestsellerForeignBookItem() async {
    _bestsellerForeignList =
        await _bestsellerRepo.getFirestoreBestsellerForeignBook();
    _bestsellerForeignCreatedAt =
        await _bestsellerRepo.getFirestoreBestsellerForeignCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreBestsellerBookItem() async {
    _bestsellerList = await _bestsellerRepo.getFirestoreBestsellerBook();
    _bestsellerCreatedAt =
        await _bestsellerRepo.getFirestoreBestsellerCreatedAt();
    notifyListeners();
  }

  List<Book> get bestsellerList => _bestsellerList;
  String get bestsellerCreatedAt => _bestsellerCreatedAt;
  List<Book> get newBookList => _newBookList;
  String get newBookCreatedAt => _newBookCreatedAt;
  List<Book> get specialNewBookList => _specialNewBookList;
  String get specialNewBookCreatedAt => _specialNewBookCreatedAt;
  List<Book> get recommendBlogList => _recommendBlogList;
  String get recommendBlogCreatedAt => _recommendBlogCreatedAt;
  List<Book> get bestsellerForeignList => _bestsellerForeignList;
  String get bestsellerForeignCreatedAt => _bestsellerForeignCreatedAt;
}
