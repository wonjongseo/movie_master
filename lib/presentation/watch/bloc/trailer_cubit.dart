import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/core/entity/trailer.dart';
import 'package:movie_report_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_report_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_report_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());
  void getMoiveTrailer(int movieId) async {
    var result = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    result.fold(
      (e) => emit(FailureLoadTrailer(errorMessage: e)),
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController youtubePlayerController =
            YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );

        emit(TrailerLoadied(youtubePlayerController: youtubePlayerController));
      },
    );
  }
}
