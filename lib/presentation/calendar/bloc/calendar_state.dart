import 'dart:collection';

import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

abstract class CalendarState {}

class CalendarStateLoading extends CalendarState {}

class CalendarStateLoaded extends CalendarState {
  final LinkedHashMap<DateTime, List<MyMovieEntity>> myMovies;

  CalendarStateLoaded({required this.myMovies});
}

class FailureLoadCalendarState extends CalendarState {
  final String errorMessage;
  FailureLoadCalendarState({required this.errorMessage});
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
