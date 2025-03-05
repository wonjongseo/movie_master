import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_report_app/core/constants/api_url.dart';
import 'package:movie_report_app/core/network/dio_client.dart';
import 'package:movie_report_app/core/network/tmdb_dio_client.dart';
import 'package:movie_report_app/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTvs();
  Future<Either> getRecommendationTvs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTv(String query);
}

class TvApiServiceImpl extends TvService {
  @override
  Future<Either> getPopularTvs() async {
    try {
      var response = await sl<TmDBDioClient>().get(ApiUrl.getPopularTv);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTvs(int tvId) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get('${ApiUrl.getTv}$tvId/${ApiUrl.getRecommendation}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTvs(int tvId) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get('${ApiUrl.getTv}$tvId/${ApiUrl.getSimilar}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response =
          await sl<TmDBDioClient>().get('${ApiUrl.getTv}$tvId/keywords');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<TmDBDioClient>().get(
        'search/tv?query=$query&include_adult=false&language=ko-KR&page=1',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }
}
