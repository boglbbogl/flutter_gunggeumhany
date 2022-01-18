import 'package:flutter/material.dart';
import 'package:flutter_gunggeumhany/repository/bestseller_repo.dart';
import 'package:flutter_gunggeumhany/repository/new_book_repo.dart';
import 'package:flutter_gunggeumhany/repository/recommend_book_repo.dart';

class AladinState extends ChangeNotifier {
  final BestsellerRepo _bestsellerRepo = BestsellerRepo();
  final NewBookRepo _newBookRepo = NewBookRepo();
  final RecommendBookRepo _recommendBookRepo = RecommendBookRepo();

  Future aladinBestsellerToFirestoreLogic() async {
    final List<String> _bestsellerISBN =
        await _bestsellerRepo.getAladinBestsellerISBN();
    await _bestsellerRepo.bestsellerAladinISBNReCallKakaoBook(
        aladinISBN: _bestsellerISBN);
  }

  Future aladinBestsellerForeignToFirestoreLogic() async {
    final List<String> _bestsellerISBN =
        await _bestsellerRepo.getAladinBestsellerForeignISBN();
    await _bestsellerRepo.bestsellerForeignAladinISBNReCallKakaoBook(
        aladinISBN: _bestsellerISBN);
  }

  Future aladinNewBookToFirestoreLogic() async {
    final List<String> _newBookISBN = await _newBookRepo.getAladinNewBookISBN();
    await _newBookRepo.newBookAladinISBNReCallKakaoBook(
        aladinISBN: _newBookISBN);
  }

  Future aladinSpecialNewBookToFirestoreLogic() async {
    final List<String> _newBookISBN =
        await _newBookRepo.getAladinSpecialNewBookISBN();
    await _newBookRepo.specialNewBookAladinISBNReCallKakaoBook(
        aladinISBN: _newBookISBN);
  }

  Future aladinRecommendBlogToFirestoreLogic() async {
    final List<String> _newBookISBN =
        await _recommendBookRepo.getAladinRecommendBlogISBN();
    await _recommendBookRepo.recommendBlogAladinISBNReCallKakaoBook(
        aladinISBN: _newBookISBN);
  }
}
