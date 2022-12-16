import 'package:list_view/domain/repository/films_repository.dart';
import '../../domain/enum/month.dart';
import '../api/api_util.dart';
import '../api/films.dart';

class FilmsDataRepository extends FilmsRepository {
  final ApiUtil apiUtil;

  FilmsDataRepository({required this.apiUtil});

  @override
  Future<Films> getFilms(Month month) {
    return apiUtil.getFilms(month);
  }
}
