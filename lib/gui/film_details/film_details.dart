import 'package:flutter/material.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/util/styles.dart';

class FilmDetailsScreen extends StatelessWidget {
  const FilmDetailsScreen(this.film, {super.key});

  final UiFilm film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          film.nameRu,
          style: Styles.navBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, film),
        ),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, UiFilm film) {
    final result = <Widget>[_bannerImage(film.posterUrlPreview), ..._renderInfo(context, film)];
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, UiFilm film) {
    final result = <Widget>[_sectionTitle(film.nameRu), _sectionText(film.nameEn)];
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text, textAlign: TextAlign.left, style: Styles.headerLarge),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Text(
        text,
        style: Styles.textDefault,
      ),
    );
  }

  Widget _bannerImage(String url) {
    return Image.network(url, fit: BoxFit.fitWidth);
  }
}
