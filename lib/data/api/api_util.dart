import 'package:injectable/injectable.dart';
import 'package:list_view/data/api/films.dart';
import 'package:list_view/data/api/service/kinopoisk_service.dart';
import 'package:list_view/domain/enum/month.dart';

@injectable
class ApiUtil {
  ApiUtil({required this.kinopoiskService});

  final KinopoiskService kinopoiskService;

  Future<Films> getFilms(Month month) async {
    final result = await kinopoiskService.getFilms(month);
    return result;
  }
}
