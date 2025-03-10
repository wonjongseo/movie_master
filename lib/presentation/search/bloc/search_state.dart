import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoadied extends SearchState {
  final List<MovieEntity> movies;
  final int selectedIndex;
  MoviesLoadied({required this.movies, this.selectedIndex = -1});
}

class TvsLoaded extends SearchState {
  final List<TVEntity> tvs;

  TvsLoaded({required this.tvs});
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
