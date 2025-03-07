import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_report_app/presentation/calendar/bloc/calendar_cubit.dart';
import 'package:movie_report_app/common/bloc/button/button_state.dart';
import 'package:movie_report_app/common/bloc/button/button_state_cubit.dart';
import 'package:movie_report_app/common/widgets/button/basic_reactive_button.dart';
import 'package:movie_report_app/common/widgets/col_text_and_widget.dart';
import 'package:movie_report_app/common/widgets/custom_text_form_field.dart';
import 'package:movie_report_app/data/my_movie/models/add_my_movie_params.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/usecases/insert_my_movie_usecase.dart';
import 'package:movie_report_app/presentation/add_my_movie/bloc/add_my_movie_cubit.dart';
import 'package:movie_report_app/presentation/add_my_movie/widgets/searched_movie.dart';
import 'package:movie_report_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_report_app/presentation/search/widgets/search_field.dart';
import 'package:movie_report_app/presentation/search/widgets/search_options.dart';
import 'package:movie_report_app/service_locator.dart';

class AddMyMoviePage extends StatelessWidget {
  const AddMyMoviePage({super.key, this.dateTime});

  final DateTime? dateTime;

  void onPressSaveBtn(BuildContext context) {
    context
        .read<AddMyMovieCubit>()
        .selecteTitle(context.read<SearchCubit>().textEditingController.text);

    context.read<ButtonStateCubit>().excute(
          usecase: sl<InsertMyMovieUsecase>(),
          params: AddMyMovieParams(
            myMovieEntity: context.read<AddMyMovieCubit>().state,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectableOptionCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => AddMyMovieCubit(dateTime: dateTime)),
        BlocProvider(create: (context) => ButtonStateCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) async {
                if (state is ButtonSuccessState) {
                  await context.read<CalendarCubit>().getMyMoviesByMonth();
                  Get.back();
                }
              },
              child: Builder(builder: (context) {
                return BasicReactiveButton(
                  title: '저장',
                  onPressed: () => onPressSaveBtn(context),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<AddMyMovieCubit, MyMovieEntity>(
                builder: (context, myMovieModel) {
              return Column(
                children: [
                  const SearchOptions(),
                  const SizedBox(height: 16),
                  _dayAndTime(context, myMovieModel),
                  const SizedBox(height: 16),

                  // SearchField(),
                  // const SizedBox(height: 16),
                  // SearchedMovie(),

                  const ColTextAndWidget(
                    label: '제목',
                    widget: SearchField(),
                  ),
                  const SizedBox(height: 16),
                  const SearchedMovie(),

                  ColTextAndWidget(
                    label: '소감',
                    widget: CustomTextFormField(
                      maxLines: 3,
                      hintText: myMovieModel.impression,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _dayAndTime(BuildContext context, MyMovieEntity myMovieModel) {
    return ColTextAndWidget(
      label: '영화 감상일',
      widget: CustomTextFormField(
        readOnly: true,
        hintText: context.read<AddMyMovieCubit>().state.watchDate != null
            ? DateFormat.yMMMd(Get.locale.toString())
                .format(myMovieModel.watchDate!)
            : '날자',
        widget: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.calendar_month),
        ),
        onTap: () => context.read<AddMyMovieCubit>().selectWatchDate(context),
      ),
    );
  }
}
