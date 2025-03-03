import 'package:dartz/dartz.dart';
import 'package:movie_report_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_report_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_report_app/core/entity/trailer.dart';
import 'package:movie_report_app/core/models/trailer.dart';
import 'package:movie_report_app/data/movie/models/movie.dart';
import 'package:movie_report_app/data/movie/sources/movie_service.dart';
import 'package:movie_report_app/domain/movie/entities/movie.dart';
import 'package:movie_report_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies(int page) async {
    var datas = await sl<MovieService>().getTrendingMovies(page);

    return datas.fold(
      (e) {
        return Left(e);
      },
      (data) {
        List<MovieEntity> movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var datas = await sl<MovieService>().getNowPlayingMovies();
    return datas.fold((e) {
      return Left(e);
    }, (data) {
      List<MovieEntity> movies = List.from(data['results'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var datas = await sl<MovieService>().getMovieTrailer(movieId);

    return datas.fold(
      (e) => Left(e),
      (data) {
        List<TrailerEntity> movies = List.from(data['results'])
            .map((item) => TrailerMapper.toEntity(TrailerModel.fromJson(item)))
            .toList();

        if (movies.isEmpty) {
          return Left('NO');
        }

        // var movie = TrailerMapper.toEntity(
        //     TrailerModel.fromJson(data['results'])); // TODO FIX
        return Right(movies[0]);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var datas = await sl<MovieService>().getRecommendationMovies(movieId);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<MovieEntity> movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var datas = await sl<MovieService>().getSimilarMovies(movieId);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<MovieEntity> movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovie(String query) async {
    var datas = await sl<MovieService>().searchMovie(query);
    return datas.fold(
      (e) => Left(e),
      (data) {
        List<MovieEntity> movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }
}
