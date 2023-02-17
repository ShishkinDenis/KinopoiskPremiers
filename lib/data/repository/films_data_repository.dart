import 'package:injectable/injectable.dart';
import 'package:list_view/data/api/api_util.dart';
import 'package:list_view/data/api/films.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/domain/repository/films_repository.dart';

@injectable
class FilmsDataRepository extends FilmsRepository {

  FilmsDataRepository({required this.apiUtil});
  final ApiUtil apiUtil;

  @override
  Future<Films> getFilms(Month month) {
    return apiUtil.getFilms(month);
  }
}
