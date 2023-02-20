import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/data/api/films.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/util/constants.dart';

@injectable
class KinopoiskService {
  KinopoiskService({required this.dio});

  final Dio dio;

  Future<Films> getFilms(Month month) async {
    final response = await dio
        .get('?${Constants.year}=${Constants.year2023}&${Constants.month}=${month.value}');
    return Films.fromApi(response.data as Map<String, dynamic>);
  }
}
