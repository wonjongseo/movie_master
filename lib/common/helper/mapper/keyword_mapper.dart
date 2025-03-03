import 'package:movie_report_app/core/entity/keyword.dart';
import 'package:movie_report_app/core/models/keyword.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keyword) {
    return KeywordEntity(
      name: keyword.name,
      id: keyword.id,
    );
  }
}
