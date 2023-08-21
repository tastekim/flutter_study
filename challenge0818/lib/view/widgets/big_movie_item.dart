import 'package:flutter/material.dart';

class BigMovieItem extends StatelessWidget {
  final String backdrop_path;
  const BigMovieItem({
    super.key,
    required this.backdrop_path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: 180,
      width: 300,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500/$backdrop_path'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
