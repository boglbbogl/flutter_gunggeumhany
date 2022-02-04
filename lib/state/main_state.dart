import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/book_review_model.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/aladin_theme_repo.dart';
import 'package:flutter_gunggeumhany/repository/aladin_repo/recommend_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';
import 'package:flutter_gunggeumhany/repository/recommend_repo.dart';

class MainState extends ChangeNotifier {
  final AladinThemeRepo _aladinThemeRepo = AladinThemeRepo();
  final AladinCategoryRepo _aladinCategoryRepo = AladinCategoryRepo();
  final RecommendRepo _recommendRepo = RecommendRepo();

  bool _isBookMoreLoading = false;
  int _moreBookItemIndex = 0;
  List<Book> _bestsellerList = [];
  String _bestsellerCreatedAt = "";
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
  List<Book> _editorSocialScience = [];
  List<Book> _editorNationalDefense = [];
  List<Book> _editorWarHistory = [];
  List<Book> _editorGeography = [];
  List<Book> _editorSFStory = [];
  List<Book> _editorMovieStory = [];
  List<Book> _editorThemeHistory = [];
  List<Book> _editorEconomyHistory = [];
  List<Book> _editorWorldPeopleHistory = [];
  List<Book> _editorArchitecture = [];
  List<Book> _editorPicture = [];
  List<Book> _hanyRecommedBook = [];
  List<Book> _editorFantasyBook = [];
  List<BookReviewUser> _newestReviewAllBook = [];
  List<Book> _allManyReviewTopRankBook = [];
  List<Book> _allStarRatingTopRankBook = [];

  MainState() {
    _moreBookItemIndex = 0;
    _isBookMoreLoading = false;
    _getFirestoreBestsellerBookItem();
    _getFirestoreSpecialNewBookItem();
    _getHanyRecommendBookItem();
    _getFirestoreRecommendBlogBookItem();
    _getFirestoreRecommendEditorCreatedAt();
    _getAllManyReviewTopRankBook();
    _getAllStarRatingTopRankBook();
    _getNewestReviewAllBook();
    notifyListeners();
  }
  Future _getAllStarRatingTopRankBook() async {
    _allStarRatingTopRankBook = await _recommendRepo.allStarRatingTopRankBook();
    notifyListeners();
  }

  Future _getAllManyReviewTopRankBook() async {
    _allManyReviewTopRankBook = await _recommendRepo.allManyReviewTopRankBook();
    notifyListeners();
  }

  Future _getNewestReviewAllBook() async {
    _newestReviewAllBook = await _recommendRepo.allReviewNewestHomeBook();
    notifyListeners();
  }

  Future _getHanyRecommendBookItem() async {
    _hanyRecommedBook = await _recommendRepo.getHanyRecommendBookItem();
    _hanyRecommedBook.shuffle();
    notifyListeners();
  }

  Future<List<Book>> _getFirestoreRecommendEditorBookItem({
    required String documentId,
  }) async {
    final List<Book> _returnBookList = await _aladinCategoryRepo
        .getFirestoreRecommendEditorBook(documentId: documentId);
    return _returnBookList;
  }

  Future _getFirestoreRecommendEditorCreatedAt() async {
    _recommendEditorCreatedAt =
        await _aladinCategoryRepo.getFirestoreRecommendEditorCreatedAt();
  }

  Future _getFirestoreRecommendBlogBookItem() async {
    _recommendBlogList =
        await _aladinCategoryRepo.getFirestoreRecommendBlogBook();
    _recommendBlogCreatedAt =
        await _aladinCategoryRepo.getFirestoreRecommendBlogCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreSpecialNewBookItem() async {
    _specialNewBookList = await _aladinThemeRepo.getFirestoreSpecialNewBook();
    _specialNewBookCreatedAt =
        await _aladinThemeRepo.getFirestoreSpecialNewBookCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreBestsellerForeignBookItem() async {
    _bestsellerForeignList =
        await _aladinThemeRepo.getFirestoreBestsellerForeignBook();
    _bestsellerForeignCreatedAt =
        await _aladinThemeRepo.getFirestoreBestsellerForeignCreatedAt();
    notifyListeners();
  }

  Future _getFirestoreBestsellerBookItem() async {
    _bestsellerCreatedAt =
        await _aladinThemeRepo.getFirestoreBestsellerCreatedAt();
    _bestsellerList = await _aladinThemeRepo.getFirestoreBestsellerBook();
    notifyListeners();
  }

  Future categoryMoreBookFirstItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _getFirestoreBestsellerForeignBookItem();
    _editorFantasyBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorFantasy);
    notifyListeners();
    _editorMysteryStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorMystery);
    _editorDramaStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorDrama);
    _editorTravelBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorTravelBook);
    notifyListeners();
    _editorSelfImprovement = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorSelfImprovement);
    notifyListeners();
    _isBookMoreLoading = false;
    _moreBookItemIndex = 1;
    notifyListeners();
  }

  Future categoryMoreBookSecondItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorHistoryBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorHistoryBook);
    notifyListeners();
    _editorCollegeTextBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorCollegeTextBook);
    notifyListeners();
    _editorArtAndCulture = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorArtAndCulture);
    notifyListeners();
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
    notifyListeners();
    _editorForeignLanguage = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorForeignLanguage);
    notifyListeners();
    _editorChildBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorChildBook);
    notifyListeners();
    _editorCartoon = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorCartoon);
    notifyListeners();
    _editorComputerAndMobile = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorComputerAndMobile);
    notifyListeners();
    _editorMusicBook = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorMusicBook);
    _isBookMoreLoading = false;
    _moreBookItemIndex = 3;
    notifyListeners();
  }

  Future categoryMoreBookForthItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorSocialScience = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorSocialScience);
    notifyListeners();
    _editorNationalDefense = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorNationalDefense);
    notifyListeners();
    _editorWarHistory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorWarHistory);
    notifyListeners();
    _editorGeography = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorGeography);
    notifyListeners();
    _editorSFStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorSFStory);
    notifyListeners();
    _editorMovieStory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorMovieStroy);
    _isBookMoreLoading = false;
    _moreBookItemIndex = 4;
    notifyListeners();
  }

  Future categoryMoreBookFifthItem() async {
    _isBookMoreLoading = true;
    notifyListeners();
    _editorThemeHistory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorThemeHistory);
    notifyListeners();
    _editorEconomyHistory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorEconomyHistory);
    notifyListeners();
    _editorWorldPeopleHistory = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorWorldPeopleHistory);
    notifyListeners();
    _editorArchitecture = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorArchitecture);
    notifyListeners();
    _editorPicture = await _getFirestoreRecommendEditorBookItem(
        documentId: documentEditorPicture);

    _isBookMoreLoading = false;
    _moreBookItemIndex = 5;
    notifyListeners();
  }

  bool get isBookMoreLoading => _isBookMoreLoading;
  int get moreBookItemIndex => _moreBookItemIndex;

  List<Book> get bestsellerList => _bestsellerList;
  String get bestsellerCreatedAt => _bestsellerCreatedAt;
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
  //
  List<Book> get editorSocialScience => _editorSocialScience;
  List<Book> get editorNationalDefense => _editorNationalDefense;
  List<Book> get editorWarHistory => _editorWarHistory;
  List<Book> get editorGeography => _editorGeography;
  List<Book> get editorSFStory => _editorSFStory;
  List<Book> get editorMovieStory => _editorMovieStory;
  List<Book> get editorThemeHistory => _editorThemeHistory;
  List<Book> get editorEconomyHistory => _editorEconomyHistory;
  List<Book> get editorWorldPeopleHistory => _editorWorldPeopleHistory;
  List<Book> get editorArchitecture => _editorArchitecture;
  List<Book> get editorPicture => _editorPicture;
  //
  List<Book> get hanyRecommedBook => _hanyRecommedBook;
  List<Book> get editorFantasyBook => _editorFantasyBook;
  List<BookReviewUser> get newestReviewAllBook => _newestReviewAllBook;
  List<Book> get allManyReviewTopRankBook => _allManyReviewTopRankBook;
  List<Book> get allStarRatingTopRankBook => _allStarRatingTopRankBook;
}
