import 'package:list_view/domain/repository/films_repository.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/data/api/api_util.dart';
import 'package:list_view/data/api/films.dart';

class FilmsDataRepository extends FilmsRepository {
  final ApiUtil apiUtil;

  FilmsDataRepository({required this.apiUtil});

  @override
  Future<Films> getFilms(Month month) {
    return apiUtil.getFilms(month);
  }
}
