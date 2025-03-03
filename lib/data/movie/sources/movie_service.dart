import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_report_app/core/constants/api_url.dart';
import 'package:movie_report_app/core/network/dio_client.dart';
import 'package:movie_report_app/core/network/tmdb_dio_client.dart';
import 'package:movie_report_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies(int page);
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies(int page) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get(ApiUrl.getTrendingMovie, queryParameters: {'page': page});
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<TmDBDioClient>().get(ApiUrl.getNowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get('${ApiUrl.getMoive}$movieId/${ApiUrl.getMovieTrailer}');

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get('${ApiUrl.getMoive}$movieId/${ApiUrl.getRecommendation}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await sl<TmDBDioClient>()
          .get('${ApiUrl.getMoive}$movieId/${ApiUrl.getSimilar}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<TmDBDioClient>().get(
        'search/movie?query=$query&include_adult=false&language=en-US&page=1',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }
}
