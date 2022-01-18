import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/bestseller_repo.dart';

class BestsellerState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();

  Future aladinBestsellerToFirestoreLogic() async {
    final List<String> _bestsellerISBN =
        await _bestsellerRepo.getAladinBestsellerISBN();
    await _bestsellerRepo.bestsellerAladinISBNReCallKakaoBook(
        aladinISBN: _bestsellerISBN);
  }
}
