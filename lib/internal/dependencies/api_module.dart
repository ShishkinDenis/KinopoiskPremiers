import 'package:list_view/data/api/service/kinopoisk_service.dart';
import '../../data/api/api_util.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ?? ApiUtil(KinopoiskService());
  }
}
