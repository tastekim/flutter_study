import 'package:flutter/material.dart';

class SmallMovieItem extends StatelessWidget {
  final String backdrop_path, title;
  const SmallMovieItem({
    super.key,
    required this.backdrop_path,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            alignment: Alignment.center,
            height: 140,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/$backdrop_path'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 110,
            child: Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                text: TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}