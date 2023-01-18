import 'package:list_view/domain/model/film.dart';

class Films {
  late List<Film> items;

  Films.fromApi(Map<String, dynamic> json) {
    items = [];
    json['items'].forEach((film) {
      final Film apiFilm = Film(
          nameEn: film['nameEn'],
          nameRu: film['nameRu'],
          posterUrlPreview: film['posterUrlPreview']);
      items.add(apiFilm);
      //TODO why does not work Film.fromJson()
      // items.add(Film.fromJson(film));
    });
  }
}
