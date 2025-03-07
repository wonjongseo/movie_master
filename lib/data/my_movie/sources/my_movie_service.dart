import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_report_app/core/constants/db_key.dart';
import 'package:movie_report_app/core/local/local_db_service.dart';
import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

abstract class MyMovieService extends LocalDbService<MyMovieEntity> {
  Future<Either> getMyMoviesByMonth(DateTime month);
}

class MyMovieServiceImpl extends MyMovieService {
  @override
  Future<Either> getAll() async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);

      var allData = box.values.toList();

      return Right(allData);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getItem({required String key}) async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);

      return Right(box.get(key));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> insertItem({
    required String key,
    required MyMovieEntity object,
  }) async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);
      await box.put(key, object);

      return const Right('Success');
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);

      return box.isEmpty;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either> getMyMoviesByMonth(DateTime month) async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);

      var allData = box.values
          .where((data) =>
              data.watchDate!.year == month.year &&
              data.watchDate!.month == month.month)
          .toList();

      return Right(allData);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> deleteItem({required String key}) async {
    try {
      var box = await Hive.openBox<MyMovieEntity>(DbKey.myMovieDBKey);
      box.delete(key);

      return const Right('기록한 영화가 삭제되었습니다.');
    } catch (e) {
      log(e.toString());
      return const Left('나중에 다시 시도해주세요.');
    }
  }
}
