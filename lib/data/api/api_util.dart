import 'package:list_view/data/api/service/kinopoisk_service.dart';
import '../../domain/enum/month.dart';
import 'films.dart';

class ApiUtil {
  final KinopoiskService kinopoiskService;

  ApiUtil({required this.kinopoiskService});

  Future<Films> getFilms(Month month) async {
    final result = await kinopoiskService.getFilms(month);
    return result;
  }
}
