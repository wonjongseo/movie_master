import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/helper/app_function.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';

class EditMyMovieCubit extends Cubit<MyMovieEntity> {
  MyMovieEntity? myMovieModel;
  EditMyMovieCubit({this.myMovieModel}) : super(MyMovieEntity());

  void selectWatchDate(BuildContext context) async {
    DateTime? watchDateTime = await AppFunction.pickDate(context);

    emit(state.copyWith(watchDate: watchDateTime));
  }

  void selectedMovie(MovieEntity movie) {
    emit(state.copyWith(movieEntity: movie));
  }
}
