import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';
import 'package:flutter_gunggeumhany/service/profile_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

SliverList profileUserWidget({
  required BuildContext context,
  required String userKey,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Column(
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
                      itemSize: 16,
                      padding: 3,
                      icon: Icons.favorite_rounded,
                      color: Colors.pink),
                ],
              ),
            ],
          )
        ],
      ),
    )
  ]));
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
