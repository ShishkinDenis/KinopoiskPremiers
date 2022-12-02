import 'package:list_view/data/api/service/kinopoisk_service.dart';
import 'films.dart';

class ApiUtil {
  final KinopoiskService _kinopoiskService;

  ApiUtil(this._kinopoiskService);

  Future<Films> getFilms(String month) async {
    final result = await _kinopoiskService.getFilms(month);
    return result;
  }
}
