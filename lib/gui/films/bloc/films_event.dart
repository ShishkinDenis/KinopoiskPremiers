part of 'films_bloc.dart';

@immutable
abstract class FilmsEvent {
  const FilmsEvent();
}

class GetFilmsList extends FilmsEvent {
  final Month month;

  const GetFilmsList({required this.month});
}
