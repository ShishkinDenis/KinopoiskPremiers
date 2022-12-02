import '../../domain/model/film.dart';
import '../api/ui_film.dart';

class FilmMapper {
  static UiFilm fromApi(Film film) {
    return UiFilm(
        nameRu: film.nameRu,
        nameEn: film.nameEn,
        posterUrlPreview: film.posterUrlPreview);
  }
}
