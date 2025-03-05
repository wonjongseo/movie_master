import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_cubit.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_state.dart';
import 'package:movie_report_app/presentation/calendar/temp.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<MyMovieEntity> _getEventsForDay(DateTime day) {
    // Implementation example
    // return kEvents[day] ?? [];
    return [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
    });

    // `start` or `end` could be null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => CalendarCubit()..getAllMyMovies(),
              child: BlocBuilder<CalendarCubit, CalendarState>(
                  builder: (context, state) {
                if (state is CalendarStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is FailureLoadCalendarState) {
                  return Text(state.errorMessage);
                }
                if (state is CalendarStateLoaded) {
                  return TableCalendar<MyMovieEntity>(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    // selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: CalendarFormat.month,
                    // eventLoader: (day) {},
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    shouldFillViewport: true,
                    daysOfWeekHeight: 30,
                    onDaySelected: _onDaySelected,
                    onRangeSelected: _onRangeSelected,
                    calendarBuilders: CalendarBuilders(
                      singleMarkerBuilder: (context, day, event) {
                        return Container();
                      },
                      prioritizedBuilder: (context, day, focusedDay) {
                        if (state.myMovies[day] != null) {
                          return Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/xj63YtNo9NlnspYpLR29A9fuxBb.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  day.day.toString(),
                                  style: TextStyle(color: Colors.white),
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
                      // cellAlignment: Alignment.topCenter,
                    ),
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  );
                }

                return Container();
              }),
            ),
          ),
        ],
      )),
    );
  }
}
