import 'package:beamer/beamer.dart';
import 'package:flutter_gunggeumhany/presentation/auth/sign_in_page.dart';
import 'package:flutter_gunggeumhany/service/auth_state.dart';
import 'package:flutter_gunggeumhany/service/router/location.dart';
import 'package:provider/provider.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        return context.watch<AuthState>().userProfile != null;
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
