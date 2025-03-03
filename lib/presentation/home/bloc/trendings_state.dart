import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;

  TrendingsMoviesLoaded({
    required this.movies,
  });
}

class FailureLoadTrendingsMovies extends TrendingsState {
  final String errorMessage;

  FailureLoadTrendingsMovies({required this.errorMessage});
}
