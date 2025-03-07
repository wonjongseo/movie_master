import 'package:dartz/dartz.dart';
import 'package:movie_report_app/data/my_movie/sources/my_movie_service.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/service_locator.dart';

class MyMovieRepositoryImpl extends MyMovieRepository {
  @override
  Future<Either> getAllMyMovies() async {
    return sl<MyMovieService>().getAll();
  }

  @override
  Future<Either> getMyMovie({required String key}) {
    return sl<MyMovieService>().getItem(key: key);
  }

  @override
  Future<Either> addMyMovie(
      {required String key, required MyMovieEntity myMovie}) {
    return sl<MyMovieService>().insertItem(key: key, object: myMovie);
  }

  @override
  Future<Either> getMyMoviesByMonth(DateTime month) async {
    return sl<MyMovieService>().getMyMoviesByMonth(month);
  }
}
