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
        collectionName: collectionRecommendBlog);
    return _result;
  }

  Future<List<Book>> getFirestoreRecommendBlogBook() async {
    final _result =
        await aladinFromFirestore(collectionName: collectionRecommendBlog);
    return _result;
  }

  Future recommendBlogAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: collectionRecommendBlog, queryType: "BlogBest");
  }

  Future recommendEditorAladinISBNReCallKakaoBook() async {
    await aladinToFirestore(
        collectionName: documentEditorMystery,
        categoryId: "50926",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorDrama,
        categoryId: "51242",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorComputerAndMobile,
        categoryId: "351",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorEssay,
        categoryId: "55889",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorCartoon,
        categoryId: "2551",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorSelfImprovement,
        categoryId: "336",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorForeignLanguage,
        categoryId: "1322",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorCollegeTextBook,
        categoryId: "8257",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorMusicBook,
        categoryId: "50966",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorHistoryBook,
        categoryId: "74",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorTravelBook,
        categoryId: "1196",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorArtAndCulture,
        categoryId: "517",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorOldStory,
        categoryId: "2105",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorChildBook,
        categoryId: "1108",
        queryType: "");
    await aladinToFirestore(
        collectionName: documentEditorFantasy,
        categoryId: "50928",
        queryType: "");
  }

  // Firestore get

  Future<String> getFirestoreRecommendEditorCreatedAt() async {
    final _result = await aladinFromFirestoreCreatedAt(
        collectionName: collectionRecommendEditor,
        documentName: documentEditorMystery);
    return _result;
  }

  Future<List<Book>> getFirestoreRecommendEditorBook({
    required String documentId,
  }) async {
    final _result = await aladinFromFirestore(
        collectionName: collectionRecommendEditor, documentName: documentId);
    return _result;
  }
}
