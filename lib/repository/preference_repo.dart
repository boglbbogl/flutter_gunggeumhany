import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/model/preference_model.dart';

class PreferenceRepo {
  static final PreferenceRepo _preferenceRepo = PreferenceRepo._internal();
  factory PreferenceRepo() => _preferenceRepo;
  PreferenceRepo._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<List<PreferenceModel>> getPreferenceModel()async{
  //   final
  // }
}
