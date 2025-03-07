import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_controller.dart';
import 'package:movie_report_app/presentation/calendar/temp.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBack extends GetView<CalendarController> {
  const CalendarBack({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Obx(
            () => Expanded(
              child: TableCalendar<MyMovieEntity>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: controller.focusedDay.value,
                shouldFillViewport: true,
                daysOfWeekHeight: 30,
                onDaySelected: controller.onDaySelected,
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context, day, event) {
                    return Container();
                  },
                  prioritizedBuilder: (context, day, focusedDay) {
                    if (controller.myMovies.value[day] != null) {
                      String? title =
                          controller.myMovies.value[day]![0].title ?? '';
                      String? url = controller
                          .myMovies.value[day]![0].movieEntity
                          ?.getPosterPath();

                      return Stack(
                        children: [
                          if (url != null)
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(url!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            Text(title),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    }
                    return Text(day.day.toString());
                  },
                ),
                calendarStyle: CalendarStyle(
                  markersMaxCount: 1,
                  markersAutoAligned: false,
                  rangeHighlightScale: 12,
                  outsideDaysVisible: false,
                  cellAlignment: Alignment.center,
                  tableBorder: TableBorder.all(color: Colors.grey),
                ),
                onPageChanged: (focusedDay) {
                  controller.getMyMoviesByMonth(focusedDay);
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
