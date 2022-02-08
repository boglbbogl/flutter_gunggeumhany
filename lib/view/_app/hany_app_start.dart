// import 'package:flutter/material.dart';
// import 'package:flutter_gunggeumhany/view/_app/hany_app.dart';
// import 'package:flutter_gunggeumhany/view/splash/splash_screen.dart';

// class HanyAppStart extends StatelessWidget {
//   const HanyAppStart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Future.delayed(const Duration(milliseconds: 2000), () => 0),
//         builder: (context, snapshot) {
//           return AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             child: _splashLoadingWidget(snapshot),
//           );
//         });
//   }

//   StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
//     if (snapshot.hasError) {
//       return Text('hasError : ${snapshot.hasError}');
//     } else if (snapshot.hasData) {
//       return const HanyApp();
//     } else {
//       return const SplashScreen();
//     }
//   }
// }
