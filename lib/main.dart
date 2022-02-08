import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/view/_app/hany_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:provider/provider.dart';

import 'repository/keys/config_reader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await Firebase.initializeApp();
  KakaoContext.clientId = '86e16ec9ff8293e68e2e7983be638f94';
  Provider.debugCheckInvalidValueType = null;
  runApp(const HanyApp());
}
