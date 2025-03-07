import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_report_app/common/widgets/col_text_and_widget.dart';
import 'package:movie_report_app/common/widgets/custom_text_form_field.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/presentation/edit_my_movie/bloc/edit_my_movie_cubit.dart';
import 'package:movie_report_app/presentation/edit_my_movie/widgets/searched_movie.dart';
import 'package:movie_report_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_report_app/presentation/search/widgets/search_field.dart';
import 'package:movie_report_app/presentation/search/widgets/search_options.dart';

class EditMyMoviePage extends StatelessWidget {
  EditMyMoviePage({super.key, this.dateTime});

  final DateTime? dateTime;

  final TextEditingController _titleCnt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SelectableOptionCubit()),
              BlocProvider(create: (context) => SearchCubit()),
              BlocProvider(
                create: (context) => EditMyMovieCubit(dateTime: dateTime),
              )
            ],
            child: BlocBuilder<EditMyMovieCubit, MyMovieEntity>(
                builder: (context, myMovieModel) {
              return Column(
                children: [
                  const SearchOptions(),
                  const SizedBox(height: 16),
                  _dayAndTime(context, myMovieModel),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  SearchField(),
                  const SizedBox(height: 16),
                  SearchedMovie(),
                  const SizedBox(height: 16),

                  ColTextAndWidget(
                    label: '제목',
                    widget: CustomTextFormField(
                      controller: _titleCnt,
                      hintText: myMovieModel.movieEntity?.title,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ColTextAndWidget(
                    label: '소감',
                    widget: CustomTextFormField(
                      hintText: myMovieModel.impression,
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () async {
                        context.read<EditMyMovieCubit>().aa();
                        // sl<InsertMyMovieUsecase>().call(params: {
                        //   '12': MyMovieEntity(
                        //       title: 'Hello',
                        //       watchDate: DateTime.now(),
                        //       impression: 'Good !!')
                        // });
                      },
                      child: Text('Test')),
                  // CustomTextFormField(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _dayAndTime(BuildContext context, MyMovieEntity myMovieModel) {
    return CustomTextFormField(
      readOnly: true,
      hintText: context.read<EditMyMovieCubit>().state.watchDate != null
          ? DateFormat.yMMMd(Get.locale.toString())
              .format(myMovieModel.watchDate!)
          : '날자',
      widget: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.calendar_month),
      ),
      onTap: () => context.read<EditMyMovieCubit>().selectWatchDate(context),
    );
  }
}
