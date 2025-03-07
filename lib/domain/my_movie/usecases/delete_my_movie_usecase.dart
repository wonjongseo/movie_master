import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class DeleteMyMovieUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MyMovieRepository>().deleteMyMovie(key: params!);
  }
}
