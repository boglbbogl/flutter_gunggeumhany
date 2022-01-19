import 'package:flutter_gunggeumhany/repository/keys/_firestore_keys.dart';

class AladinEditorCategory {
  final String collectionName;
  final String categoryId;

  AladinEditorCategory(this.collectionName, this.categoryId);
}

List<AladinEditorCategory> aladinCategoryItemFirst = [
  AladinEditorCategory(documentEditorMystery, "50926"),
  AladinEditorCategory(documentEditorDrama, "51242"),
  AladinEditorCategory(documentEditorComputerAndMobile, "351"),
  AladinEditorCategory(documentEditorEssay, "55889"),
  AladinEditorCategory(documentEditorCartoon, "2551"),
  AladinEditorCategory(documentEditorSelfImprovement, "336"),
  AladinEditorCategory(documentEditorForeignLanguage, "1322"),
];

List<AladinEditorCategory> aladinCategoryItemSecond = [
  AladinEditorCategory(documentEditorCollegeTextBook, "8257"),
  AladinEditorCategory(documentEditorMusicBook, "50966"),
  AladinEditorCategory(documentEditorHistoryBook, "74"),
  AladinEditorCategory(documentEditorTravelBook, "1196"),
  AladinEditorCategory(documentEditorArtAndCulture, "517"),
  AladinEditorCategory(documentEditorOldStory, "2105"),
  AladinEditorCategory(documentEditorChildBook, "1108"),
];
