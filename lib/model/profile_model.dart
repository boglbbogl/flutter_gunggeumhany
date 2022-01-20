import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/model/review.dart';
import 'package:flutter_gunggeumhany/model/user_activity.dart';
import 'package:flutter_gunggeumhany/model/user_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required UserProfile userProfile,
    required UserActivity userActivity,
    required List<Review> review,
    required List<Book> book,
  }) = _ProfileModel;
}
