import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/model/book.dart';
import 'package:flutter_gunggeumhany/repository/bestseller_repo.dart';

class MainState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();

  List<Book> _bestsellerList = [];

  Future getFirestoreBestsellerBookItem() async {
    _bestsellerList = await _bestsellerRepo.getFirestoreBestsellerBook();
    notifyListeners();
  }

  List<Book> get bestsellerList => _bestsellerList;
}
