import '../../data/api/films.dart';

abstract class FilmsRepository {
  Future<Films> getFilms(String month);
}
