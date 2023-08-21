import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String time;
  const TimeCard({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 12,
            child: Container(
              width: 120,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            child: Container(
              width: 135,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xffe64d3d),
              fontSize: 80,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}