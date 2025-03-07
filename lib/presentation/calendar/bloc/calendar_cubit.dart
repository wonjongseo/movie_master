import 'dart:collection';
import 'package:get/get.dart';
import 'package:movie_report_app/domain/my_movie/usecases/get_my_movie_by_month_usecase.dart';
import 'package:movie_report_app/presentation/edit_my_movie/pages/edit_my_movie_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_state.dart';
import 'package:movie_report_app/service_locator.dart';

class CalendarController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  late Rx<DateTime> selectedDay;
  Rx<String> errorMessage = Rx('');

  var myMovies = LinkedHashMap<DateTime, List<MyMovieEntity>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  @override
  void onInit() {
    selectedDay = focusedDay;
    getMyMoviesByMonth(focusedDay.value);
    super.onInit();
  }

  getMyMoviesByMonth(DateTime month) async {
    var result = await sl<GetMyMovieByMonthUsecase>().call(params: month);

    result.fold((e) {
      errorMessage.value = e;
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
      myMovies.value.assignAll(linkedMap);
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay!.value = selectedDay;
    this.focusedDay!.value = focusedDay;
    if (myMovies.value[selectedDay] == null) {
      Get.to(
        () => EditMyMoviePage(dateTime: selectedDay),
      );
    } else {
      print('object');
    }
  }
}
