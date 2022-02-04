import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_from_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/aladin_to_firestore.dart';
import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class AladinCategoryRepo {
  static final AladinCategoryRepo _aladinCategoryRepo =
      AladinCategoryRepo._internal();
  factory AladinCategoryRepo() => _aladinCategoryRepo;
  AladinCategoryRepo._internal();

  Future<String> getFirestoreRecommendBlogCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionAladinTheme,
        documentName: documentRecommedBlog);
    return _result;
  }

  Future<List<Book>> getFirestoreRecommendBlogBook() async {
    final _result = await aladinFromFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentRecommedBlog);
    return _result;
  }

  Future recommendBlogAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionAladinTheme,
        documentName: documentRecommedBlog,
        queryType: "BlogBest");
  }

  Future recommendEditorAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorMystery,
        categoryId: "50926",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorDrama,
        categoryId: "51242",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorComputerAndMobile,
        categoryId: "351",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorEssay,
        categoryId: "55889",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorCartoon,
        categoryId: "2551",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorSelfImprovement,
        categoryId: "336",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorForeignLanguage,
        categoryId: "1322",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorCollegeTextBook,
        categoryId: "8257",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorMusicBook,
        categoryId: "50966",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorHistoryBook,
        categoryId: "74",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorTravelBook,
        categoryId: "1196",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorArtAndCulture,
        categoryId: "517",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorOldStory,
        categoryId: "2105",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorChildBook,
        categoryId: "1108",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorFantasy,
        categoryId: "50928",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorSocialScience,
        categoryId: "798",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorNationalDefense,
        categoryId: "51050",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorWarHistory,
        categoryId: "51407",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorGeography,
        categoryId: "51011",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorSFStory,
        categoryId: "50930",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorMovieStroy,
        categoryId: "51239",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorThemeHistory,
        categoryId: "81",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorEconomyHistory,
        categoryId: "27795",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorWorldPeopleHistory,
        categoryId: "5566",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorArchitecture,
        categoryId: "50969",
        queryType: "");
    await aladinToFirestore(
        collectionName: collectionAladinCategory,
        documentName: documentEditorPicture,
        categoryId: "50968",
        queryType: "");
  }

  // Firestore get

  Future<String> getFirestoreRecommendEditorCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionAladinCategory,
        documentName: documentEditorMystery);
    return _result;
  }

  Future<List<Book>> getFirestoreRecommendEditorBook({
    required String documentId,
  }) async {
    final _result = await aladinFromFirestore(
        collectionName: collectionAladinCategory, documentName: documentId);
    return _result;
  }
}
