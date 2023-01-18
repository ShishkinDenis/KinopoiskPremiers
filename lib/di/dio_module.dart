import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/util/constants.dart';

@module
abstract class DioModule {
  @singleton
  BaseOptions baseOptions() {
    return BaseOptions(baseUrl: Constants.baseUrl, headers: {
      Constants.xApiKey: Constants.apiKey,
      Constants.contentTypeTitle: Constants.contentType,
    });
  }

  @singleton
  Dio dio(BaseOptions baseOptions) {
    Dio dio = Dio(baseOptions);
    return dio;
  }
}
