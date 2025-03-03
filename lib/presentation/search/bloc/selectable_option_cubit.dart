import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movie, tv }

class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.movie);

  void selectMovie() => emit(SearchType.movie);

  void selechTv() => emit(SearchType.tv);
}
