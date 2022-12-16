import '../../data/api/films.dart';
import '../enum/month.dart';

abstract class FilmsRepository {
  Future<Films> getFilms(Month month);
}
