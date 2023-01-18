import 'package:list_view/domain/model/film.dart';
import 'package:list_view/data/api/ui_film.dart';

class FilmMapper {
  static UiFilm fromApi(Film film) {
    return UiFilm(
        nameRu: film.nameRu,
        nameEn: film.nameEn,
        posterUrlPreview: film.posterUrlPreview);
  }
}
