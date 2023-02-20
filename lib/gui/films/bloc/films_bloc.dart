import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/data/mapper/films_to_ui_film_list_mapper.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/domain/repository/films_repository.dart';
import 'package:meta/meta.dart';

part 'films_event.dart';

part 'films_state.dart';

@injectable
class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc({required this.filmsRepository}) : super(FilmsInitial()) {
    on<GetFilmsList>((event, emit) async {
      try {
        emit(FilmsLoading());
        final films = await filmsRepository.getFilms(event.month);
        emit(FilmsLoaded(FilmsToUiFilmListMapper.map(films)));
      } on Exception {
        emit(FilmsError());
      }
    });
  }

  final FilmsRepository filmsRepository;
}
