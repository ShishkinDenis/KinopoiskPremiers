import 'package:dio/dio.dart';
import '../films.dart';

class KinopoiskService {
  //TODO move URL and KEY to separate file
  //TODO add changing params - month, year

  static const _baseUrl =
      'https://kinopoiskapiunofficial.tech/api/v2.2/films/premieres';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl, headers: {
      'X-API-KEY': 'ea2d8faf-7451-4b43-83e1-386fcf829f02',
      'Content-Type': 'application/json',
    }),
  );

  Future<Films> getFilms(String month) async {
    final response = await _dio.get('?year=2022&month=$month');
    return Films.fromApi(response.data);
  }
}
