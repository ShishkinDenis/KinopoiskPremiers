part of 'films_bloc.dart';

@immutable
abstract class FilmsState {
  const FilmsState();
}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  const FilmsLoaded(this.films);

  final List<UiFilm> films;
}

class FilmsError extends FilmsState {
  const FilmsError(this.message);

  final String? message;
}
