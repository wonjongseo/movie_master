import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_report_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class SearchTvUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepositoriy>().searchTv(params!);
  }
}
