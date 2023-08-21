class Movie {
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
  final bool adult, video;
  final List<dynamic> genre_ids;
  
  final num popularity, vote_average, id, vote_count;

  Movie.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        genre_ids = json['genre_ids'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        video = json['video'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'];
}
