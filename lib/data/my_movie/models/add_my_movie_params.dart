import 'package:movie_report_app/domain/my_movie/entity/my_movie_entity.dart';

class AddMyMovieParams {
  late String key;
  final MyMovieEntity myMovieEntity;
  AddMyMovieParams({
    required this.myMovieEntity,
  }) {
    key = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
