import 'package:flutter/material.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/util/styles.dart';

class FilmInfo extends StatelessWidget {
  final UiFilm film;

  const FilmInfo(this.film, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          film.nameRu,
          style: Styles.navBarTitle,
        )),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, film),
        )));
  }

  List<Widget> _renderBody(BuildContext context, UiFilm film) {
    var result = <Widget>[];
    result.add(_bannerImage(film.posterUrlPreview));
    result.addAll(_renderInfo(context, film));
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, UiFilm film) {
    var result = <Widget>[];
    result.add(_sectionTitle(film.nameRu));
    result.add(_sectionText(film.nameEn));
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child:
            Text(text, textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(
          text,
          style: Styles.textDefault,
        ));
  }

  Widget _bannerImage(String url) {
    return Container(child: Image.network(url, fit: BoxFit.fitWidth));
  }
}
