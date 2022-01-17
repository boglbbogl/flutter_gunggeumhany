import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/activity_repo.dart';

class ActivityState extends ChangeNotifier {
  final ActivityRepo _activityRepo = ActivityRepo();

  Future addBookmark({
    required String userKey,
    required String bookDocKey,
  }) async {
    await _activityRepo.addBookmark(userKey: userKey, bookDocKey: bookDocKey);
  }

  Future removeBookmark({
    required String userKey,
    required String bookDocKey,
  }) async {
    await _activityRepo.removeBookmark(
        userKey: userKey, bookDocKey: bookDocKey);
  }
}
