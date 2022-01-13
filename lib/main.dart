import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/hany_app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  runApp(const HanyApp());
}
