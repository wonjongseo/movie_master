import 'package:dartz/dartz.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

abstract class MyMovieRepository {
  Future<Either> getAllMyMovies();
  Future<Either> getMyMoviesByMonth(DateTime month);
  Future<Either> getMyMovie({required String key});
  Future<Either> addMyMovie(
      {required String key, required MyMovieEntity myMovie});

  Future<Either> deleteMyMovie({required String key});
}
