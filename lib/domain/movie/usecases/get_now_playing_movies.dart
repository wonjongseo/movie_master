import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class GetNowPlayingMovies extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
