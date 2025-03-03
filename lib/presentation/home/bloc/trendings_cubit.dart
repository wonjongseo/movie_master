import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_report_app/presentation/home/bloc/trendings_state.dart';
import 'package:movie_report_app/service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsMoviesLoading());

  void getTrendingMovies(int page) async {
    var returnedDate = await sl<GetTrendingMovies>().call(params: page);
    returnedDate.fold(
      (e) {
        emit(FailureLoadTrendingsMovies(errorMessage: e));
      },
      (data) {
        emit(TrendingsMoviesLoaded(movies: data));
      },
    );
  }
}
