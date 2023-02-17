part of 'films_bloc.dart';

@immutable
abstract class FilmsEvent {
  const FilmsEvent();
}

class GetFilmsList extends FilmsEvent {
  const GetFilmsList({required this.month});

  final Month month;
}
