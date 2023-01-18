import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:list_view/domain/repository/user_repository.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:list_view/gui/films/bloc/films_bloc.dart';
import 'package:list_view/gui/login/bloc/login_bloc.dart';
import 'package:list_view/data/api/api_util.dart';
import 'package:list_view/data/api/service/kinopoisk_service.dart';
import 'package:list_view/data/repository/films_data_repository.dart';
import 'package:list_view/domain/repository/films_repository.dart';
import 'package:list_view/util/constants.dart';

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
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerFactory<AuthenticationBloc>(() => AuthenticationBloc());
  getIt.registerFactory<LoginBloc>(() => LoginBloc(
      userRepository: getIt<UserRepository>(), authenticationBloc: getIt<AuthenticationBloc>()));
  getIt.registerFactory<FilmsBloc>(() => FilmsBloc(filmsRepository: getIt<FilmsRepository>()));
}
