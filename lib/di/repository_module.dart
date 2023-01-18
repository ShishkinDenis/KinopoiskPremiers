import 'package:injectable/injectable.dart';
import 'package:list_view/data/api/api_util.dart';
import 'package:list_view/data/repository/films_data_repository.dart';
import 'package:list_view/domain/repository/films_repository.dart';

@module
abstract class RepositoryModule {
  @injectable
  FilmsRepository repositoryModule(ApiUtil apiUtil) {
    return FilmsDataRepository(apiUtil: apiUtil);
  }
}
