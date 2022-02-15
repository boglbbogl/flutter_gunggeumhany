import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:flutter_gunggeumhany/repository/activity_repo.dart';
import 'package:flutter_gunggeumhany/view/core/app_flushbar.dart';

class ActivityState extends ChangeNotifier {
  final ActivityRepo _activityRepo = ActivityRepo();
  List<UserProfile> _followerList = [];
  List<UserProfile> _followingList = [];

  Future userBlockRequest({
    required String userKey,
    required String blockedUserKey,
    required BuildContext context,
  }) async {
    await _activityRepo.userBlockRequest(
        userBlocked: UserBlocked(
      requestUserKey: userKey,
      blockedUserKey: blockedUserKey,
      content: "content",
      isCheck: false,
    ));
    Navigator.of(context).pop();
    appFlushbar(message: '신고가 접수 되었습니다. 확인 후 조치 하겠습니다').show(context);
  }

  Future getFollowerAndFollowingList(
      {required UserActivity userActivity}) async {
    _followerList = await _activityRepo.getFollowerUserList(
        followerUserKey: userActivity.followerUserKey);
    _followingList = await _activityRepo.getFollowingUserList(
        followingUserKey: userActivity.followingUserKey);
  }

  Future addFollowing({
    required String myUserKey,
    required String followingUserKey,
  }) async {
    await _activityRepo.addFollowing(
        myUserKey: myUserKey, followingUserKey: followingUserKey);
  }

  Future removeFollowing({
    required String myUserKey,
    required String followingUserKey,
  }) async {
    await _activityRepo.removeFollowing(
        myUserKey: myUserKey, followingUserKey: followingUserKey);
  }

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

  List<UserProfile> get followerList => _followerList;
  List<UserProfile> get followingList => _followingList;
}
