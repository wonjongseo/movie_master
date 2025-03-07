import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/presentation/watch/bloc/trailer_cubit.dart';
import 'package:movie_report_app/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerBody extends StatelessWidget {
  const VideoPlayerBody({super.key, required this.movieId});

  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMoiveTrailer(movieId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrailerLoadied) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            );
          }
          if (state is FailureLoadTrailer) {
            return const Text('');
          }
          return Container();
        },
      ),
    );
  }
}
