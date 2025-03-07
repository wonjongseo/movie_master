import 'package:dartz/dartz.dart';

abstract class LocalDbService<T> {
  Future<Either> getAll();

  Future<Either> getItem({required String key});

  /// Insert Data To Data Base
  Future<Either> insertItem({required String key, required T object});

  /// is Data Available
  Future<bool> isDataAvailable();

  Future<Either> deleteItem({required String key});
}
