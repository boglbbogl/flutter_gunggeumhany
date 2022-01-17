import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/presentation/core/app_color.dart';

InkWell userImage({
  required String imageUrl,
  required String nickName,
  double? radius = 25,
}) {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        SizedBox(
          width: radius,
          height: radius,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: radius,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
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
        ),
        const SizedBox(width: 8),
        Text(
          nickName,
          style: theme.textTheme.bodyText2!.copyWith(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
