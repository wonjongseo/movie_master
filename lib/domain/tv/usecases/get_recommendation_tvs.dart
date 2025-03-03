import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class GetRecommendationTvsUserCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepositoriy>().getRecommendationTvs(params!);
  }
}
