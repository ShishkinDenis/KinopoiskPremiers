import 'package:list_view/data/api/films.dart';
import 'package:list_view/domain/enum/month.dart';

abstract class FilmsRepository {
  Future<Films> getFilms(Month month);
}
