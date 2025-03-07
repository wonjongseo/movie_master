import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/widgets/custom_cahced_network_image.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_cubit.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_state.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state is CalendarStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CalendarStateLoaded) {
              return _tableCalendar(state, context);
            }
            if (state is FailureLoadCalendarState) {
              return Text(state.errorMessage);
            }
            return Container();
          },
        ),
      ),
    );
  }

  TableCalendar<Object?> _tableCalendar(
      CalendarStateLoaded state, BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.horizontalSwipe,
      shouldFillViewport: true,
      daysOfWeekHeight: 30,
      focusedDay: state.focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2300),
      onDaySelected: (selectedDay, focusedDay) {
        context.read<CalendarCubit>().onDaySelected(selectedDay, focusedDay);
      },
      calendarStyle: CalendarStyle(
        markersMaxCount: 1,
        markersAutoAligned: false,
        rangeHighlightScale: 12,
        outsideDaysVisible: false,
        cellAlignment: Alignment.center,
        tableBorder: TableBorder.all(color: Colors.grey),
      ),
      onPageChanged: (focusedDay) {
        context
            .read<CalendarCubit>()
            .getMyMoviesByMonth(focusedDay: focusedDay);
      },
      calendarBuilders: CalendarBuilders(
        singleMarkerBuilder: (context, day, event) {
          return Container();
        },
        prioritizedBuilder: (context, day, focusedDay) {
          if (state.myMovies[day] != null) {
            String? title = state.myMovies[day]![0].title ?? '';
            String? url = state.myMovies[day]![0].movieEntity?.getPosterPath();

            return Stack(
              children: [
                if (url != null)
                  CustomCahcedNetworkImage(url: url)
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
    );
  }
}
