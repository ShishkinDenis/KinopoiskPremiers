import 'package:auto_route/auto_route.dart';
import 'package:list_view/gui/favourites/favourites.dart';
import 'package:list_view/gui/film_details/film_details.dart';
import 'package:list_view/gui/films/films.dart';
import 'package:list_view/gui/home.dart';
import 'package:list_view/gui/initial_bloc_provider_screen.dart';
import 'package:list_view/gui/login/login.dart';
import 'package:list_view/gui/splash_screen.dart';
import 'package:list_view/util/constants.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: Constants.replaceInAutoRouteName,
  routes: <AutoRoute>[
    AutoRoute(page: InitialBlocProviderScreen, initial: true),
    AutoRoute(page: SplashScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(
      page: HomeScreen,
      children: [
        AutoRoute(page: FilmsScreen, name: Constants.filmsRouter),
        AutoRoute(page: FavouritesScreen, name: Constants.favouritesRouter),
      ],
    ),
    AutoRoute(page: FilmDetailsScreen),
  ],
)
class $AppRouter {}
