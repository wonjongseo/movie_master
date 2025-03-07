import 'package:hive/hive.dart';
import 'package:movie_report_app/core/configs/assets/app_images.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class MovieEntity extends HiveObject {
  MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @HiveField(0)
  final String? backdropPath;
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? originalTitle;
  @HiveField(4)
  final String? overview;
  @HiveField(5)
  final String? posterPath;
  @HiveField(6)
  final String? mediaType;
  @HiveField(7)
  final bool? adult;
  @HiveField(8)
  final String? originalLanguage;
  @HiveField(9)
  final List<int> genreIds;
  @HiveField(10)
  final double? popularity;
  @HiveField(11)
  final DateTime? releaseDate;
  @HiveField(12)
  final bool? video;
  @HiveField(13)
  final double? voteAverage;
  @HiveField(14)
  final int? voteCount;

  String getPosterPath() {
    if (posterPath == null) return AppImages.defaultImage;
    String imagePath = AppImages.movieImageBasePath + posterPath!;

    return imagePath;
  }

  String? get getBackdropPathImagePath {
    if (backdropPath == null) return null;
    String imagePath = AppImages.movieImageBasePath + backdropPath!;

    return imagePath;
  }
}
