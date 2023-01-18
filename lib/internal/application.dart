import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view/gui/SplashScreen.dart';
import 'package:list_view/gui/films/films.dart';
import 'package:list_view/gui/login/login.dart';
import 'package:list_view/locator/locator.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ApplicationState();
  }
}

class _ApplicationState extends State<Application> {
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = getIt<AuthenticationBloc>();
    authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => authenticationBloc,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationInitial) {
              return const SplashScreen();
            } else if (state is AuthenticationAuthenticated) {
              return const FilmsScreen();
            } else if (state is AuthenticationUnauthenticated) {
              return const LoginScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
