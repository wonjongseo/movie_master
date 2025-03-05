import 'package:hive/hive.dart';

import 'package:movie_report_app/domain/movie/entities/movie.dart';

part 'my_movie_entity.g.dart';

@HiveType(typeId: 1)
class MyMovieEntity extends HiveObject {
  @HiveField(0)
  DateTime? watchDate;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? impression;
  @HiveField(3)
  MovieEntity? movieEntity;
  @HiveField(4)
  List<String>? withWatchPerson;
  MyMovieEntity({
    this.watchDate,
    this.title,
    this.withWatchPerson,
    this.movieEntity,
    this.impression,
  });

  MyMovieEntity copyWith({
    DateTime? watchDate,
    String? title,
    String? movieIamge,
    MovieEntity? movieEntity,
    String? impression,
    List<String>? withWatchPerson,
  }) {
    return MyMovieEntity(
      watchDate: watchDate ?? this.watchDate,
      movieEntity: movieEntity ?? this.movieEntity,
      impression: impression ?? this.impression,
      title: title ?? this.title,
      withWatchPerson: withWatchPerson ?? this.withWatchPerson,
    );
  }

  @override
  String toString() {
    return 'MyMovieEntity(watchDate: $watchDate, title: $title, impression: $impression, movieEntity: $movieEntity, withWatchPerson: $withWatchPerson)';
  }
}
