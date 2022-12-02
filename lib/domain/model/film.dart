class Film {
  late final String nameRu;
  late final String nameEn;
  late final String posterUrlPreview;

  Film(
      {required this.nameRu,
      required this.nameEn,
      required this.posterUrlPreview});

  Film.fromJson(Map<String, dynamic> json) {
    nameRu:json['nameRu'];
    nameEn:json['nameEn'];
    posterUrlPreview:json['posterUrlPreview'];
  }
}
