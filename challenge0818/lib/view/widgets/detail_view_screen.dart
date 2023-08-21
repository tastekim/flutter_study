import 'package:challenge0818/model/movie_detail_model.dart';
import 'package:challenge0818/model/movie_model.dart';
import 'package:challenge0818/services/movie_api.dart';
import 'package:flutter/material.dart';

class DetailMovieInfoWidget extends StatelessWidget {
  final Movie movie;
  const DetailMovieInfoWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    int point = movie.vote_average.toDouble().ceil();
    double starCnt = point / 2;

    MoviesApi().getMovieDetails(movie.id.toString());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Back to list',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, weight: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
          future: MoviesApi().getMovieDetails(movie.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              MovieDetails detail = snapshot.data!;

              var hour = (detail.runtime / 60).floor();
              var min = detail.runtime - (hour * 60);

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${movie.poster_path}'),
                        fit: BoxFit.fitHeight,
                        colorFilter: const ColorFilter.mode(
                            Colors.black38, BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25),
                        SizedBox(
                          child: Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              text: TextSpan(
                                  text: movie.original_title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            for (int i = 1; i < 6; i++)
                              i <= starCnt
                                  ? const Icon(
                                      Icons.star_rate_rounded,
                                      size: 30,
                                      color: Colors.amber,
                                    )
                                  : Icon(Icons.star_rate_rounded,
                                      size: 30, color: Colors.grey.shade300)
                          ],
                        ),
                        const SizedBox(height: 18),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                '${hour}h ${min}min | ',
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              for (var genre in detail.genres)
                                Text(
                                  '${genre["name"]}, ',
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Storyline',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 18),
                        SingleChildScrollView(
                          child: SizedBox(
                            width: 350,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Flexible(
                              child: RichText(
                                text: TextSpan(
                                    text: movie.overview,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      height: 1.4,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 30),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 66,
                            decoration: BoxDecoration(
                              color: const Color(0xfff8d848),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'Buy ticket',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center();
          }),
    );
  }
}
