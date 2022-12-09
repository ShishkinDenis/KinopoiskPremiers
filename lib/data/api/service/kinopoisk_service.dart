import 'package:dio/dio.dart';
import 'package:list_view/util/constants.dart';
import '../../../domain/enum/month.dart';
import '../films.dart';

class KinopoiskService {
  final Dio dio;

  KinopoiskService({required this.dio});

  Future<Films> getFilms(Month month) async {
    final response = await dio
        .get('?${Constants.year}=${Constants.year2023}&${Constants.month}=${month.enName}');
    return Films.fromApi(response.data);
  }
}
