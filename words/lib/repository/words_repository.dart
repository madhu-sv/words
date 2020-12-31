import 'package:words/networking/ApiProvider.dart';
import 'package:words/model/words_response.dart';
import 'dart:async';

class WordsRepository {
  ApiProvider _provider = ApiProvider();

  Future<WordsResponse> fetchWordDetails(String word) async {
    final response = await _provider.get("words/" + word);
    return WordsResponse.fromJson(response);
  }
}