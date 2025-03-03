import 'package:dartz/dartz.dart';

abstract class TvRepositoriy {
  Future<Either> getPopularTvs();
  Future<Either> getRecommendationTvs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTv(String query);
}
