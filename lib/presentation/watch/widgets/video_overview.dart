import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  const VideoOverview({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          overview,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium!
              .copyWith(color: Colors.black),
        )
      ],
    );
  }
}
