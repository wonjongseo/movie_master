import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_report_app/common/helper/app_function.dart';
import 'package:movie_report_app/data/my_movie/models/add_my_movie_params.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/domain/my_movie/usecases/insert_my_movie_usecase.dart';
import 'package:movie_report_app/service_locator.dart';

class EditMyMovieCubit extends Cubit<MyMovieEntity> {
  DateTime? dateTime;
  EditMyMovieCubit({this.dateTime}) : super(MyMovieEntity(watchDate: dateTime));

  void selectWatchDate(BuildContext context) async {
    DateTime? watchDateTime = await AppFunction.pickDate(context);

    emit(state.copyWith(watchDate: watchDateTime));
  }

  void selectedMovie(MovieEntity movie) {
    emit(state.copyWith(movieEntity: movie));
  }

  void aa() async {
    var result = await sl<InsertMyMovieUsecase>().call(
      params: AddMyMovieParams(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          myMovieEntity: state),
    );

    result.fold((e) {
      print(e);
    }, (data) {
      Get.back();
    });
  }
}
