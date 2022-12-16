import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view/gui/films/month_dropdown.dart';
import '../../data/api/ui_film.dart';
import '../../domain/enum/month.dart';
import '../../util/strings.dart';
import '../film_details/film_info.dart';
import '../../util/styles.dart';
import 'bloc/films_bloc.dart';

//TODO pull-to-refresh
class FilmsScreen extends StatefulWidget {
  const FilmsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilmsScreenState();
  }
}

class _FilmsScreenState extends State<FilmsScreen> {
  final FilmsBloc _filmsBloc = FilmsBloc();

  @override
  void initState() {
    _filmsBloc.add(const GetFilmsList(month: Month.january));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              Strings.kinopoiskPremiers,
              style: Styles.navBarTitle,
            )),
        body: Column(
          children: [
            MonthDropdown(onChangeMonth: (month) => _filmsBloc.add(GetFilmsList(month: month))),
            Expanded(child: _buildListFilms())
          ],
        ));
  }

  Widget _buildListFilms() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _filmsBloc,
        child: BlocConsumer<FilmsBloc, FilmsState>(
          listener: (context, state) {
            if (state is FilmsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FilmsInitial) {
              return _buildLoading();
            } else if (state is FilmsLoading) {
              return _buildLoading();
            } else if (state is FilmsLoaded) {
              return _buildCard(context, state.films);
            } else if (state is FilmsError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<UiFilm> films) {
    return ListView.builder(
        itemCount: films.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _listViewItemBuilder(context, index, films);
        });
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

Widget _listViewItemBuilder(BuildContext context, int index, List<UiFilm> films) {
  var filmDetail = films[index];
  return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(filmDetail),
      title: _itemTitle(filmDetail),
      onTap: () {
        _navigationToFilmDetail(context, filmDetail);
      });
}

void _navigationToFilmDetail(BuildContext context, UiFilm filmDetail) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return FilmInfo(filmDetail);
  }));
}

Widget _itemThumbnail(UiFilm filmDetail) {
  return Container(
    constraints: const BoxConstraints.tightFor(width: 100.0),
    child: Image.network(filmDetail.posterUrlPreview, fit: BoxFit.fitWidth),
  );
}

Widget _itemTitle(UiFilm filmDetail) {
  return Text(filmDetail.nameRu, style: Styles.textDefault);
}
