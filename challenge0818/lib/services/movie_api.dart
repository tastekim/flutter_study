import 'dart:convert';

import 'package:challenge0818/model/movie_detail_model.dart';
import 'package:challenge0818/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  final String baseUrl = 'movies-api.nomadcoders.workers.dev';
  final String detailUrl = 'movies-api.nomadcoders.workers.dev';

  Future<List<Movie>> getMovies(String type) async {
    var url = Uri.https(baseUrl, type);
    var response = await http.get(url);

    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    List<Movie> result = [];
    var jsonList = decodeResponse['results'].map((data) => data).toList();
    for (var movie in jsonList) {
      result.add(Movie.fromJson(movie));
    }
    return result;
  }

  Future<MovieDetails> getMovieDetails(String id) async {
    var url = Uri.https(detailUrl, 'movie', {'id': id});
    var response = await http.get(url);

    var decodeResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    MovieDetails data = MovieDetails.fromjson(decodeResponse);

    return data;
  }
}
