part of 'films_bloc.dart';

@immutable
abstract class FilmsEvent {
  const FilmsEvent();
}

class GetFilmsList extends FilmsEvent{
  final String month;

  const GetFilmsList({required this.month});
}


