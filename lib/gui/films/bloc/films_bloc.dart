import 'package:bloc/bloc.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/data/mapper/films_to_ui_film_list_mapper.dart';
import 'package:list_view/domain/repository/films_repository.dart';
import 'package:list_view/internal/dependencies/repository_module.dart';
import 'package:meta/meta.dart';

import '../../../util/strings.dart';

part 'films_event.dart';

part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc() : super(FilmsInitial()) {
    final FilmsRepository filmsRepository = RepositoryModule.filmsRepository();

    on<GetFilmsList>((event, emit) async {
      try {
        emit(FilmsLoading());
        final films = await filmsRepository.getFilms(event.month);
        emit(FilmsLoaded(FilmsToUiFilmListMapper.map(films)));
      } on Exception {
        emit(const FilmsError(Strings.failedFetchData));
      }
    });
  }
}
