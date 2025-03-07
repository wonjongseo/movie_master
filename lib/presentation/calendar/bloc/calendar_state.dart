import 'dart:collection';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

abstract class CalendarState {
  final DateTime focusedDay;
  late DateTime selectedDay;

  CalendarState({required this.focusedDay}) {
    selectedDay = focusedDay;
  }
}

class CalendarStateInit extends CalendarState {
  CalendarStateInit({required super.focusedDay});
}

class CalendarStateLoading extends CalendarState {
  CalendarStateLoading({required super.focusedDay});
}

class CalendarStateLoaded extends CalendarState {
  final LinkedHashMap<DateTime, List<MyMovieEntity>> myMovies;

  CalendarStateLoaded({
    required this.myMovies,
    required super.focusedDay,
  });
}

class FailureLoadCalendarState extends CalendarState {
  final String errorMessage;
  FailureLoadCalendarState({
    required this.errorMessage,
    required super.focusedDay,
  });
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
