import 'package:tazah_tech_sale/data/models/movie.dart';
import 'package:tazah_tech_sale/data/models/movie_details_model.dart';
import 'package:tazah_tech_sale/networking/api_helper.dart';

class MovieRepository {
  final String _apiKey = 'd93e6d9c3b5fcab07e81413051dc186e';
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> fetchMovieList() async {
    final response = await _helper.get("popular?api_key=$_apiKey");
    if (response is Map<String, dynamic>) {
      return Movies.fromJson(response);
    } else {
      return response;
    }
  }


  Future<dynamic> fetchMovieDetails(String movieId) async {
    final response = await _helper.get("$movieId?api_key=$_apiKey");
    if (response is Map<String, dynamic>) {
      return MovieDetails.fromJson(response);
    } else {
      return response;
    }
  }
}
