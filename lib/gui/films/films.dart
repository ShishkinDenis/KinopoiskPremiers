import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/gui/films/bloc/films_bloc.dart';
import 'package:list_view/gui/films/month_dropdown.dart';
import 'package:list_view/util/constants.dart';
import 'package:list_view/util/styles.dart';

// TODO(ShishkinDenis): pull-to-refresh
class FilmsScreen extends StatefulWidget {
  const FilmsScreen(this.month, {super.key});

  final Month month;

  @override
  State<StatefulWidget> createState() {
    return _FilmsScreenState();
  }
}

class _FilmsScreenState extends State<FilmsScreen> {
  final FilmsBloc _filmsBloc = getIt<FilmsBloc>();
  late List<UiFilm> _films;

  @override
  void initState() {
    _filmsBloc.add(GetFilmsList(month: widget.month));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context)!.kinopoiskPremiers,
          style: Styles.navBarTitle,
        ),
      ),
      body: Column(
        children: [
          MonthDropdown(
            month: widget.month,
            onChangeMonth: (month) => _filmsBloc.add(GetFilmsList(month: month)),
          ),
          Expanded(child: _buildListFilms())
        ],
      ),
    );
  }

  Widget _buildListFilms() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BlocProvider(
        create: (_) => _filmsBloc,
        child: BlocConsumer<FilmsBloc, FilmsState>(
          listener: (context, state) {
            if (state is FilmsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.failedFetchData),
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
              _films = state.films;
              return _buildCard(context, _films);
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
    return ReorderableListView.builder(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = _films.removeAt(oldIndex);
          _films.insert(newIndex, item);
        });
      },
      itemCount: films.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _listViewItemBuilder(context, index, films);
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

Widget _listViewItemBuilder(BuildContext context, int index, List<UiFilm> films) {
  final filmDetail = films[index];
  return ListTile(
    key: ValueKey(filmDetail),
    contentPadding: const EdgeInsets.all(10),
    leading: _itemThumbnail(filmDetail),
    trailing: const Icon(Icons.drag_handle),
    title: _itemTitle(filmDetail),
    onTap: () {
      _navigationToFilmDetail(context, filmDetail);
    },
  );
}

void _navigationToFilmDetail(BuildContext context, UiFilm filmDetail) {
  context.push(Constants.filmInfo, extra: filmDetail);
}

Widget _itemThumbnail(UiFilm filmDetail) {
  return Container(
    constraints: const BoxConstraints.tightFor(width: 100),
    child: Image.network(filmDetail.posterUrlPreview, fit: BoxFit.fitWidth),
  );
}

Widget _itemTitle(UiFilm filmDetail) {
  return Text(filmDetail.nameRu, style: Styles.textDefault);
}
