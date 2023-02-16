import 'package:list_view/domain/model/film.dart';

class Films {
  Films.fromApi(Map<String, dynamic> json) {
    items = [];
    json['items'].forEach((film) {
      final apiFilm = Film(
          nameEn: film['nameEn'] as String,
          nameRu: film['nameRu'] as String,
          posterUrlPreview: film['posterUrlPreview'] as String);
      items.add(apiFilm);
    });
  }

  late List<Film> items;
}
