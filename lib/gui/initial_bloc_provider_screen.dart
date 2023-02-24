import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:list_view/gui/films/films.dart';
import 'package:list_view/gui/login/login.dart';
import 'package:list_view/gui/splash_screen.dart';

class InitialBlocProviderScreen extends StatelessWidget {
  const InitialBlocProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return const SplashScreen();
        } else if (state is AuthenticationAuthenticated) {
          return const FilmsScreen(Month.january);
        } else if (state is NotificationClickedState) {
          return FilmsScreen(state.month);
        } else if (state is AuthenticationUnauthenticated) {
          return const LoginScreen();
        } else {
          return Container();
        }
      },
    );
  }
}
