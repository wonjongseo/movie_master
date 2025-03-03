import 'package:dartz/dartz.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';
import 'package:movie_report_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class GetPopularTvsUserCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepositoriy>().getPopularTvs();
  }
}
