import 'package:beamer/beamer.dart';
import 'package:flutter_gunggeumhany/state/router/location.dart';
import 'package:flutter_gunggeumhany/view/auth/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../auth_state.dart';

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
