import 'package:challenge0818/services/movie_api.dart';
import 'package:challenge0818/view/coming_soon_widget.dart';
import 'package:flutter/material.dart';

import 'view/now_in_cinemas_widget.dart';
import 'view/popular_movies_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MoviesApi _moviesApi = MoviesApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 160),
                const Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  child: PopularMoviesWidget(moviesApi: _moviesApi),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Now in Cinemas',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                NowInCinemasWidget(moviesApi: _moviesApi),
                const SizedBox(height: 20),
                const Text(
                  'Coming soon',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                ComingSoonWidget(moviesApi: _moviesApi),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
