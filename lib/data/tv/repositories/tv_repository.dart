import 'package:dartz/dartz.dart';
import 'package:movie_report_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_report_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_report_app/core/entity/keyword.dart';
import 'package:movie_report_app/core/models/keyword.dart';
import 'package:movie_report_app/data/tv/models/tv.dart';
import 'package:movie_report_app/data/tv/sources/tv_service.dart';
import 'package:movie_report_app/domain/tv/entities/tv.dart';
import 'package:movie_report_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class TvRepositoriesImpl extends TvRepositoriy {
  @override
  Future<Either> getPopularTvs() async {
    var result = await sl<TvService>().getPopularTvs();
    return result.fold((e) => Left(e), (data) {
      List<TVEntity> tvs = List.from(data['results'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tvs);
    });
  }

  @override
  Future<Either> getRecommendationTvs(int tvId) async {
    var datas = await sl<TvService>().getRecommendationTvs(tvId);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<TVEntity> movies = List.from(data['results'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTvs(int tvId) async {
    var datas = await sl<TvService>().getSimilarTvs(tvId);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<TVEntity> movies = List.from(data['results'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var datas = await sl<TvService>().getKeywords(tvId);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<KeywordEntity> keywords = List.from(data['results'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();

        return Right(keywords);
      },
    );
  }

  @override
  Future<Either> searchTv(String query) async {
    var datas = await sl<TvService>().searchTv(query);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<TVEntity> movies = List.from(data['results'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }
}
