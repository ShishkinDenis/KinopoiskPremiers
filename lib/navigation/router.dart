import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:list_view/data/api/ui_film.dart';
import 'package:list_view/gui/SplashScreen.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:list_view/gui/film_details/film_info.dart';
import 'package:list_view/gui/films/films.dart';
import 'package:list_view/gui/login/login.dart';
import 'package:list_view/util/constants.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: Constants.initialScreen, builder: _initialScreenRouteBuilder),
  GoRoute(path: Constants.filmsScreen, builder: _filmsScreenRouteBuilder),
  GoRoute(path: Constants.filmInfo, builder: _filmInfoScreenRouteBuilder)
]);

Widget _initialScreenRouteBuilder(BuildContext context, GoRouterState state) {
  return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
    if (state is AuthenticationInitial) {
      return const SplashScreen();
    } else if (state is AuthenticationAuthenticated) {
      return const FilmsScreen();
    } else if (state is AuthenticationUnauthenticated) {
      return const LoginScreen();
    } else {
      return Container();
    }
  });
}

Widget _filmsScreenRouteBuilder(BuildContext context, GoRouterState state) => const FilmsScreen();

Widget _filmInfoScreenRouteBuilder(BuildContext context, GoRouterState state) {
  UiFilm filmDetail = state.extra as UiFilm;
  return FilmInfo(filmDetail);
}
