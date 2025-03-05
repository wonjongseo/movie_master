import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/domain/movie/usecases/search_movies.dart';
import 'package:movie_report_app/domain/tv/usecases/search_tv.dart';
import 'package:movie_report_app/presentation/search/bloc/search_state.dart';
import 'package:movie_report_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_report_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isEmpty) return;
    emit(SearchLoading());

    switch (searchType) {
      case SearchType.movie:
        searchMovie(query);
        break;
      case SearchType.tv:
        searchTv(query);
        break;
    }
  }

  void searchMovie(String query) async {
    var result = await sl<SearchMoviesUseCase>().call(params: query);
    result.fold(
      (e) => emit(SearchFailure(errorMessage: e)),
      (data) => emit(
        MoviesLoadied(movies: data),
      ),
    );
  }

  void searchTv(String query) async {
    var result = await sl<SearchTvUseCase>().call(params: query);
    result.fold(
      (e) => emit(SearchFailure(errorMessage: e)),
      (data) => emit(
        TvsLoaded(tvs: data),
      ),
    );
  }
}
