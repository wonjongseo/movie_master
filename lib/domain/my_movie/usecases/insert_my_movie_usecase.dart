import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class InsertMyMovieUsecase extends UseCase<Either, Map<String, MyMovieEntity>> {
  @override
  Future<Either> call({Map<String, MyMovieEntity>? params}) async {
    return await sl<MyMovieRepository>().addMyMovie(
        key: params!.keys.toList()[0], myMovie: params.values.toList()[0]);
  }
}
