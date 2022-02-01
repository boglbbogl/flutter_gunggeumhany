import 'package:freezed_annotation/freezed_annotation.dart';

part 'preference_model.freezed.dart';
part 'preference_model.g.dart';

@freezed
class PreferenceModel with _$PreferenceModel {
  const factory PreferenceModel({
    required String isbn13,
    required String isbn10,
    required String title,
    required List<String> category,
    required double starRating,
  }) = _PreferenceModel;
  factory PreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$PreferenceModelFromJson(json);
  const PreferenceModel._();
  Map<dynamic, dynamic> toMap() {
    final _map = {};
    _map["isbn13"] = isbn13;
    _map["isbn10"] = isbn10;
    _map["title"] = title;
    _map["category"] = category;
    _map["starRating"] = starRating;
    return _map;
  }

  factory PreferenceModel.empty() => const PreferenceModel(
        isbn13: "",
        isbn10: "",
        title: "",
        category: [],
        starRating: 0.0,
      );
}
