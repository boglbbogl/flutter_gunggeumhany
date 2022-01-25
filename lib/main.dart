import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/_app/hany_app_start.dart';
import 'package:provider/provider.dart';

import 'repository/keys/config_reader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(const HanyAppStart());
}
