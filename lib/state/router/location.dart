import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gunggeumhany/view/home/home_page.dart';

// Main Location
class Location extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(child: HomePage(), key: ValueKey('/main')),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}
