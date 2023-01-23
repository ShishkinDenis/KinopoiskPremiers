import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:list_view/navigation/router.dart';

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
    return BlocProvider(
        create: (_) => authenticationBloc,
        child: MaterialApp.router(
          routerConfig: router,
        ));
  }
}
