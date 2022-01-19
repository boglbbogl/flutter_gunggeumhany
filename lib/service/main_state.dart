import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/bestseller_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/new_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/recommend_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class MainState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();
  final NewBookRepo _newBookRepo = NewBookRepo();
  final RecommendBookRepo _recommendBookRepo = RecommendBookRepo();
  bool _isBookMoreLoading = false;
  int _moreBookItemIndex = 0;
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
  String _recommendEditorCreatedAt = "";
  List<Book> _editorArtAndCulture = [];
  List<Book> _editorCartoon = [];
  List<Book> _editorChildBook = [];
  List<Book> _editorCollegeTextBook = [];
  List<Book> _editorComputerAndMobile = [];
  List<Book> _editorDramaStory = [];
  List<Book> _editorEssay = [];
  List<Book> _editorForeignLanguage = [];
  List<Book> _editorHistoryBook = [];
  List<Book> _editorMusicBook = [];
  List<Book> _editorMysteryStory = [];
  List<Book> _editorOldStory = [];
  List<Book> _editorSelfImprovement = [];
  List<Book> _editorTravelBook = [];

  MainState() {
    _moreBookItemIndex = 0;
    _isBookMoreLoading = false;
    _getFirestoreBestsellerBookItem();
    _getFirestoreSpecialNewBookItem();
    _getFirestoreRecommendBlogBookItem();
    _getFirestoreBestsellerForeignBookItem();
    _getFirestoreNewBookItem();
    _getFirestoreRecommendEditorCreatedAt();
    notifyListeners();
  }

  Future<List<Book>> _getFirestoreRecommendEditorBookItem({
    required String documentId,
  }) async {
    final List<Book> _returnBookList = await _recommendBookRepo
        .getFirestoreRecommendEditorBook(documentId: documentId);
    return _returnBookList;
  }

  Future _getFirestoreRecommendEditorCreatedAt() async {
    _recommendEditorCreatedAt =
        await _recommendBookRepo.getFirestoreRecommendEditorCreatedAt();
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

  Future categoryMoreBookFirstItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorMysteryStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorMystery);
    _editorDramaStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorDrama);
    _editorTravelBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorTravelBook);
    _editorSelfImprovement = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorSelfImprovement);
    _isBookMoreLoading = false;
    _moreBookItemIndex = 1;
    notifyListeners();
  }

  Future categoryMoreBookSecondItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorHistoryBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorHistoryBook);
    _editorCollegeTextBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorCollegeTextBook);
    _editorArtAndCulture = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorArtAndCulture);
    _editorChildBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorChildBook);
    _editorEssay = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorEssay);
    _isBookMoreLoading = false;
    _moreBookItemIndex = 2;
    notifyListeners();
  }

  Future categoryMoreBookThirdItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorOldStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorOldStory);
    _editorForeignLanguage = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorForeignLanguage);
    _editorCartoon = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorCartoon);
    _editorComputerAndMobile = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorComputerAndMobile);
    _editorMusicBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorMusicBook);
    _isBookMoreLoading = false;
    _moreBookItemIndex = 3;
    notifyListeners();
  }

  bool get isBookMoreLoading => _isBookMoreLoading;
  int get moreBookItemIndex => _moreBookItemIndex;

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
  String get recommendEditorCreatedAt => _recommendEditorCreatedAt;
  List<Book> get editorArtAndCulture => _editorArtAndCulture;
  List<Book> get editorCartoon => _editorCartoon;
  List<Book> get editorChildBook => _editorChildBook;
  List<Book> get editorCollegeTextBook => _editorCollegeTextBook;
  List<Book> get editorComputerAndMobile => _editorComputerAndMobile;
  List<Book> get editorDramaStory => _editorDramaStory;
  List<Book> get editorEssay => _editorEssay;
  List<Book> get editorForeignLanguage => _editorForeignLanguage;
  List<Book> get editorHistoryBook => _editorHistoryBook;
  List<Book> get editorMusicBook => _editorMusicBook;
  List<Book> get editorMysteryStory => _editorMysteryStory;
  List<Book> get editorOldStory => _editorOldStory;
  List<Book> get editorSelfImprovement => _editorSelfImprovement;
  List<Book> get editorTravelBook => _editorTravelBook;
}