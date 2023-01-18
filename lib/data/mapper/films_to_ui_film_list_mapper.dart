import 'package:list_view/data/api/ui_film.dart';

import 'package:list_view/data/api/films.dart';
import 'package:list_view/data/mapper/film_mapper.dart';

class FilmsToUiFilmListMapper {
  static List<UiFilm> map(Films films) {
    List<UiFilm> uiFilms = [];
    for (var element in films.items) {
      uiFilms.add(FilmMapper.fromApi(element));
    }
    return uiFilms;
  }
}
