import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/core/app_color.dart';

Positioned bookRankingWidget({
  required int index,
}) {
  String _rank = "";
  switch (index) {
    case 0:
      _rank = "one";
      break;
    case 1:
      _rank = "two";
      break;
    case 2:
      _rank = "three";
      break;
    case 3:
      _rank = "four";
      break;
    case 4:
      _rank = "five";
      break;
    case 5:
      _rank = "six";
      break;
    case 6:
      _rank = "seven";
      break;
    case 7:
      _rank = "eight";
      break;
    case 8:
      _rank = "nine";
      break;
    case 9:
      _rank = "ten";
      break;
    default:
  }

  return Positioned(
    bottom: 0,
    left: -5,
    child: index > 9
        ? Container()
        : Container(
            width: 45,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: darkThemeMainColor,
            ),
            child: index == 9
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                      right: 4,
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/one.png',
                            width: 20,
                            height: 70,
                            fit: BoxFit.fill,
                            color: Colors.white70),
                        Image.asset('assets/images/zero.png',
                            width: 20,
                            height: 70,
                            fit: BoxFit.fill,
                            color: Colors.white70),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                      right: 8,
                    ),
                    child: Image.asset('assets/images/$_rank.png',
                        fit: BoxFit.fill, color: Colors.white70),
                  ),
          ),
  );
}
