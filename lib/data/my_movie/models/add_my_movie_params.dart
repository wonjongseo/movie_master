import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

class AddMyMovieParams {
  final String key;
  final MyMovieEntity myMovieEntity;
  AddMyMovieParams({
    required this.key,
    required this.myMovieEntity,
  });
}
