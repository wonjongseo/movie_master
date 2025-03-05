import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/usecases/get_all_my_movie_usecase.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_state.dart';
import 'package:movie_report_app/service_locator.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarStateLoading());

  getAllMyMovies() async {
    var result = await sl<GetAllMyMovieUsecase>().call();

    result.fold((e) => emit(FailureLoadCalendarState(errorMessage: e)), (data) {
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

      emit(CalendarStateLoaded(myMovies: linkedMap));
    });
  }
}
