import 'package:dartz/dartz.dart';

import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/data/my_movie/models/add_my_movie_params.dart';

import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class InsertMyMovieUsecase extends UseCase<Either, AddMyMovieParams> {
  @override
  Future<Either> call({AddMyMovieParams? params}) async {
    print('params : ${params}');

    return await sl<MyMovieRepository>().addMyMovie(
      key: params!.key,
      myMovie: params.myMovieEntity,
    );
  }
}
