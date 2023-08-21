import 'package:challenge0818/model/movie_model.dart';
import 'package:challenge0818/services/movie_api.dart';
import 'package:challenge0818/view/widgets/detail_view_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/big_movie_item.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
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
      future: _moviesApi.getMovies('popular'),
      builder: (context, snapshot) {
        var movieList = snapshot.data;
        if (movieList == null) {
          return Container();
        }
        return SizedBox(
          height: 200,
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movieList.map((movie) {
                return GestureDetector(
                  onTap: () => goToDetailsPage(context, movie),
                  child: Hero(
                    tag: movie.id,
                    child: BigMovieItem(
                      backdrop_path: movie.backdrop_path,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
