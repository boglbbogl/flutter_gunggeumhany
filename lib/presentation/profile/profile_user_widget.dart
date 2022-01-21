import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/repository/activity_repo.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/core/logger.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProfileUserWidget extends StatelessWidget {
  final String userKey;
  const ProfileUserWidget({
    Key? key,
    required this.userKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _starRating = context
            .watch<ProfileState>()
            .profileModelList
            .where((element) => element.userProfile.userKey.contains(userKey))
            .map((e) => e.userActivity.reviewInStarDocKey)
            .firstOrNull!
            .isEmpty
        ? 0.0
        : context
                .watch<ProfileState>()
                .profileModelList
                .where(
                    (element) => element.userProfile.userKey.contains(userKey))
                .map((e) => e.userActivity.reviewInStarRating)
                .firstOrNull! /
            context
                .watch<ProfileState>()
                .profileModelList
                .where(
                    (element) => element.userProfile.userKey.contains(userKey))
                .map((e) => e.userActivity.reviewInStarDocKey)
                .firstOrNull!
                .length;
    final double _favoriteRating = context
            .watch<ProfileState>()
            .profileModelList
            .where((element) => element.userProfile.userKey.contains(userKey))
            .map((e) => e.userActivity.reviewInFavoriteDocKey)
            .firstOrNull!
            .isEmpty
        ? 0.0
        : context
                .watch<ProfileState>()
                .profileModelList
                .where(
                    (element) => element.userProfile.userKey.contains(userKey))
                .map((e) => e.userActivity.reviewInFavoriteRating)
                .firstOrNull! /
            context
                .watch<ProfileState>()
                .profileModelList
                .where(
                    (element) => element.userProfile.userKey.contains(userKey))
                .map((e) => e.userActivity.reviewInFavoriteDocKey)
                .firstOrNull!
                .length;
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: context
                                .watch<ProfileState>()
                                .profileModelList
                                .where((element) => element.userProfile.userKey
                                    .contains(userKey))
                                .map((e) => e.userProfile.imageUrl)
                                .firstOrNull!,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Colors.white,
                            ),
                            fit: BoxFit.cover,
                            fadeOutDuration: const Duration(milliseconds: 5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .watch<ProfileState>()
                              .profileModelList
                              .where((element) =>
                                  element.userProfile.userKey.contains(userKey))
                              .map((e) => e.userProfile.nickName)
                              .firstOrNull!,
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _ratingIndicator(
                            rating: _starRating,
                            itemSize: 18,
                            icon: Icons.star_rounded,
                            color: Colors.amber),
                        _ratingIndicator(
                            rating: _favoriteRating,
                            itemSize: 16.5,
                            padding: 3,
                            icon: Icons.favorite_rounded,
                            color: Colors.pink),
                      ],
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: context
                          .watch<AuthState>()
                          .userActivity!
                          .followingUserKey
                          .contains(userKey)
                      ? _followingChangeForm(
                          onTap: () {
                            context.read<ActivityRepo>().removeFollowing(
                                myUserKey: context
                                    .watch<AuthState>()
                                    .userProfile!
                                    .userKey,
                                followingUserKey: userKey);
                          },
                          icon: Icons.favorite_rounded,
                          color: Colors.pink)
                      : _followingChangeForm(
                          onTap: () {
                            context.read<ActivityRepo>().addFollowing(
                                myUserKey: context
                                    .read<AuthState>()
                                    .userProfile!
                                    .userKey,
                                followingUserKey: userKey);
                          },
                          icon: Icons.favorite_border_rounded,
                          color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _userStatusForm(
                      title: '리뷰',
                      rating: context
                          .watch<ProfileState>()
                          .profileModelList
                          .where((e) => userKey.contains(e.userProfile.userKey))
                          .map((e) => e.userActivity.myReviewDocKey.length)
                          .firstOrNull!
                          .toString(),
                      color: Colors.white),
                  _userStatusForm(
                      title: '북마크',
                      rating: context
                          .watch<ProfileState>()
                          .profileModelList
                          .where((e) => userKey.contains(e.userProfile.userKey))
                          .map((e) => e.userActivity.bookmarkBookDocKey.length)
                          .firstOrNull!
                          .toString(),
                      color: appMainColor),
                  _userStatusForm(
                      title: '별점',
                      rating: _starRating.toStringAsFixed(1),
                      color: Colors.amber),
                  _userStatusForm(
                      title: '추천',
                      rating: _favoriteRating.toStringAsFixed(1),
                      color: Colors.pink),
                  _userStatusForm(
                    title: '팔로워',
                    rating: '100',
                    color: const Color.fromRGBO(195, 195, 195, 1),
                  ),
                  _userStatusForm(
                    title: '팔로잉',
                    rating: '100',
                    color: const Color.fromRGBO(195, 195, 195, 1),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }

  Column _followingChangeForm({
    required IconData icon,
    required Color color,
    required Function() onTap,
  }) {
    return Column(
      children: [
        IconButton(onPressed: onTap, icon: Icon(icon, color: color)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.pink.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text('팔로워',
                style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                )),
          ),
        )
      ],
    );
  }

  Padding _userStatusForm({
    required String title,
    required String rating,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DefaultTextStyle(
        style: theme.textTheme.bodyText2!
            .copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: color),
        child: Column(
          children: [
            Text(rating),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  RatingBarIndicator _ratingIndicator({
    required double rating,
    required IconData icon,
    required double itemSize,
    required Color color,
    double? padding = 1,
  }) {
    return RatingBarIndicator(
      itemPadding: EdgeInsets.only(right: padding!),
      rating: rating,
      itemBuilder: (context, index) => Icon(icon, color: color),
      itemSize: itemSize,
      unratedColor: const Color.fromRGBO(115, 115, 115, 1),
    );
  }
}

SliverList profileUserWidget({
  required BuildContext context,
  required String userKey,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: context
                          .watch<ProfileState>()
                          .profileModelList
                          .where((element) =>
                              element.userProfile.userKey.contains(userKey))
                          .map((e) => e.userProfile.imageUrl)
                          .firstOrNull!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.white,
                      ),
                      fit: BoxFit.cover,
                      fadeOutDuration: const Duration(milliseconds: 5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context
                        .watch<ProfileState>()
                        .profileModelList
                        .where((element) =>
                            element.userProfile.userKey.contains(userKey))
                        .map((e) => e.userProfile.nickName)
                        .firstOrNull!,
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _ratingIndicator(
                      rating: context
                              .watch<ProfileState>()
                              .profileModelList
                              .where((element) =>
                                  element.userProfile.userKey.contains(userKey))
                              .map((e) => e.userActivity.reviewInStarDocKey)
                              .firstOrNull!
                              .isEmpty
                          ? 0.0
                          : context
                                  .watch<ProfileState>()
                                  .profileModelList
                                  .where((element) => element
                                      .userProfile.userKey
                                      .contains(userKey))
                                  .map((e) => e.userActivity.reviewInStarRating)
                                  .firstOrNull! /
                              context
                                  .watch<ProfileState>()
                                  .profileModelList
                                  .where((element) => element
                                      .userProfile.userKey
                                      .contains(userKey))
                                  .map((e) => e.userActivity.reviewInStarDocKey)
                                  .firstOrNull!
                                  .length,
                      itemSize: 18,
                      icon: Icons.star_rounded,
                      color: Colors.amber),
                  _ratingIndicator(
                      rating: context
                              .watch<ProfileState>()
                              .profileModelList
                              .where((element) =>
                                  element.userProfile.userKey.contains(userKey))
                              .map((e) => e.userActivity.reviewInFavoriteDocKey)
                              .firstOrNull!
                              .isEmpty
                          ? 0.0
                          : context
                                  .watch<ProfileState>()
                                  .profileModelList
                                  .where((element) => element
                                      .userProfile.userKey
                                      .contains(userKey))
                                  .map((e) =>
                                      e.userActivity.reviewInFavoriteRating)
                                  .firstOrNull! /
                              context
                                  .watch<ProfileState>()
                                  .profileModelList
                                  .where((element) => element
                                      .userProfile.userKey
                                      .contains(userKey))
                                  .map((e) =>
                                      e.userActivity.reviewInFavoriteDocKey)
                                  .firstOrNull!
                                  .length,
                      itemSize: 16.5,
                      padding: 3,
                      icon: Icons.favorite_rounded,
                      color: Colors.pink),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _userStatusForm(
                    title: '리뷰', rating: '100', color: Colors.white),
                _userStatusForm(
                    title: '북마크', rating: '100', color: appMainColor),
                _userStatusForm(
                    title: '별점', rating: '100', color: Colors.amber),
                _userStatusForm(title: '추천', rating: '100', color: Colors.pink),
                _userStatusForm(
                  title: '팔로워',
                  rating: '100',
                  color: const Color.fromRGBO(195, 195, 195, 1),
                ),
                _userStatusForm(
                  title: '팔로잉',
                  rating: '100',
                  color: const Color.fromRGBO(195, 195, 195, 1),
                ),
              ],
            ),
          )
        ],
      ),
    )
  ]));
}

Padding _userStatusForm({
  required String title,
  required String rating,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: DefaultTextStyle(
      style: theme.textTheme.bodyText2!
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: color),
      child: Column(
        children: [
          Text(rating),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    ),
  );
}

RatingBarIndicator _ratingIndicator({
  required double rating,
  required IconData icon,
  required double itemSize,
  required Color color,
  double? padding = 1,
}) {
  return RatingBarIndicator(
    itemPadding: EdgeInsets.only(right: padding!),
    rating: rating,
    itemBuilder: (context, index) => Icon(icon, color: color),
    itemSize: itemSize,
    unratedColor: const Color.fromRGBO(115, 115, 115, 1),
  );
}
