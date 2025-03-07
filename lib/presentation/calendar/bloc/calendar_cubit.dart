import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_state.dart';
import 'package:movie_report_app/presentation/edit_my_movie/pages/edit_my_movie_page.dart';
import 'package:movie_report_app/presentation/my_movies/pages/my_movies_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/presentation/add_my_movie/pages/add_my_movie_page.dart';
import 'package:movie_report_app/service_locator.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarStateInit(focusedDay: DateTime.now()));

  ScrollController scrollController = ScrollController();

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (state is CalendarStateLoaded) {
      var myMovies = (state as CalendarStateLoaded).myMovies;

      emit(CalendarStateLoaded(myMovies: myMovies, focusedDay: focusedDay));
      if (myMovies[selectedDay] == null) {
        Get.to(() => AddMyMoviePage(dateTime: selectedDay));
      } else if (myMovies[selectedDay]!.length == 1) {
        Get.to(() => EditMyMoviePage(myMovieEntity: myMovies[selectedDay]![0]));
      } else {
        Get.to(() => MyMoviesPage(myMovies: myMovies[selectedDay]!));
      }
    }
  }

  Future<void> getMyMoviesByMonth({DateTime? focusedDay}) async {
    emit(CalendarStateLoading(focusedDay: focusedDay ?? state.focusedDay));

    var result = await sl<MyMovieRepository>()
        .getMyMoviesByMonth(focusedDay ?? state.focusedDay);

    result.fold((e) {
      emit(FailureLoadCalendarState(
        errorMessage: e,
        focusedDay: focusedDay ?? state.focusedDay,
      ));
    }, (data) {
      final linkedMap = LinkedHashMap<DateTime, List<MyMovieEntity>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      for (MyMovieEntity element in data) {
        if (element.watchDate != null) {
          if (linkedMap[element.watchDate!] == null) {
            linkedMap[element.watchDate!] = [];
          }
          linkedMap[element.watchDate!]!.add(element);
        }
      }

      emit(CalendarStateLoaded(
          myMovies: linkedMap, focusedDay: focusedDay ?? state.focusedDay));
    });
  }
}
