part of 'films_bloc.dart';

@immutable
abstract class FilmsState {
  const FilmsState();
}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  final List<UiFilm> films;

  const FilmsLoaded(this.films);
}

class FilmsError extends FilmsState {
  final String? message;

  const FilmsError(this.message);
}
