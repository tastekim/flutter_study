class MovieDetails {
  final String original_title;
  final num runtime;
  final List<dynamic> genres;

  MovieDetails.fromjson(Map<String, dynamic> json)
      : original_title = json['original_title'],
        runtime = json['runtime'],
        genres = json['genres'];
}
