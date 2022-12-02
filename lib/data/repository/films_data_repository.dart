import 'package:list_view/domain/repository/films_repository.dart';
import '../api/api_util.dart';
import '../api/films.dart';

class FilmsDataRepository extends FilmsRepository {
  final ApiUtil _apiUtil;

  FilmsDataRepository(this._apiUtil);

  @override
  Future<Films> getFilms(String month) {
    return _apiUtil.getFilms(month);
  }
}
