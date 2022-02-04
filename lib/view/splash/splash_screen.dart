import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return SizedBox(
        child: Image.asset(
          "assets/images/splash_main.gif",
          fit: BoxFit.scaleDown,
        ),
      );
    });
  }
}
