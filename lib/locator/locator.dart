import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/api/api_util.dart';
import '../data/api/service/kinopoisk_service.dart';
import '../data/repository/films_data_repository.dart';
import '../domain/repository/films_repository.dart';
import '../util/constants.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<BaseOptions>(BaseOptions(baseUrl: Constants.baseUrl, headers: {
    Constants.xApiKey: Constants.apiKey,
    Constants.contentTypeTitle: Constants.contentType,
  }));
  getIt.registerSingleton<Dio>(Dio(getIt<BaseOptions>()));
  getIt.registerSingleton<KinopoiskService>(KinopoiskService(dio: getIt<Dio>()));
  getIt.registerSingleton<ApiUtil>(ApiUtil(kinopoiskService: getIt<KinopoiskService>()));
  getIt.registerSingleton<FilmsRepository>(FilmsDataRepository(apiUtil: getIt<ApiUtil>()));
}
