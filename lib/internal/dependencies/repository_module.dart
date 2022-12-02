import '../../data/repository/films_data_repository.dart';
import '../../domain/repository/films_repository.dart';
import 'api_module.dart';

class RepositoryModule {
  static FilmsRepository? _filmsRepository;

  static FilmsRepository filmsRepository() {
    return _filmsRepository ?? FilmsDataRepository(ApiModule.apiUtil());
  }
}
