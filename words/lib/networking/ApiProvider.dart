import 'package:words/networking/CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://wordsapiv1.p.rapidapi.com/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      var headers = {
        "x-rapidapi-key": "d6c8cbef9dmshfba8025612f7541p167efcjsn892c16a8cce0",
        "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
      };
      final response = await http.get(_baseUrl + url, headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}