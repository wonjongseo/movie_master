import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(voteAverage.toStringAsFixed(1)),
      ],
    );
  }
}
