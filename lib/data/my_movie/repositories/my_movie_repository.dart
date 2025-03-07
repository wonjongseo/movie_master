import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:movie_report_app/data/my_movie/sources/my_movie_service.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';
import 'package:movie_report_app/domain/my_movie/repository/my_movie_repository.dart';
import 'package:movie_report_app/presentation/calendar/temp.dart';
import 'package:movie_report_app/service_locator.dart';
import 'package:table_calendar/table_calendar.dart';

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
    var result = await sl<MyMovieService>().getMyMoviesByMonth(month);

    return result.fold((e) => Left(e), (data) {
      return Right(data);
    });
  }

  @override
  Future<Either> deleteMyMovie({required String key}) async {
    return sl<MyMovieService>().deleteItem(key: key);
  }
}
