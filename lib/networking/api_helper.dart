import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';

import 'package:tazah_tech_sale/networking/api_exceptions.dart';
class ApiBaseHelper {

  final String _baseUrl = "http://api.themoviedb.org/3/movie/";

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print('exception in catch : $e');
      return e;
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}