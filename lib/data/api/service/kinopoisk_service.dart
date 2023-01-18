import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/util/constants.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/data/api/films.dart';

@injectable
class KinopoiskService {
  final Dio dio;

  KinopoiskService({required this.dio});

  Future<Films> getFilms(Month month) async {
    final response = await dio
        .get('?${Constants.year}=${Constants.year2023}&${Constants.month}=${month.enName}');
    return Films.fromApi(response.data);
  }
}
