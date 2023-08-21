import 'package:challenge0818/model/movie_model.dart';
import 'package:challenge0818/services/movie_api.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_view_screen.dart';
import 'widgets/small_movie_item.dart';

class NowInCinemasWidget extends StatelessWidget {
  const NowInCinemasWidget({
    super.key,
    required MoviesApi moviesApi,
  }) : _moviesApi = moviesApi;

  final MoviesApi _moviesApi;

  void goToDetailsPage(BuildContext context, Movie movie) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return DetailMovieInfoWidget(movie: movie);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _moviesApi.getMovies('now-playing'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var movieList = snapshot.data;

          return SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movieList!.map((movie) {
                return GestureDetector(
                  onTap: () => goToDetailsPage(context, movie),
                  child: Hero(
                    tag: movie.id,
                    child: SmallMovieItem(
                      backdrop_path: movie.backdrop_path,
                      title: movie.title,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return const Center();
      },
    );
  }
}
