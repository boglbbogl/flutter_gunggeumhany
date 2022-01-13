import 'package:beamer/beamer.dart';
import 'package:flutter_gunggeumhany/presentation/sign_in_page.dart';
import 'package:flutter_gunggeumhany/service/location.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        return false;
        // false -> SignIn, true -> Main
      },
      showPage: const BeamPage(child: SignInPage()),
    ),
  ],
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      Location(),
    ],
  ),
);
