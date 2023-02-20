import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:list_view/navigation/router.dart';
import 'package:list_view/util/pushes/push_notifications_manager.dart';

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
    PushNotificationsManager().listenToMessages(_handlePushClick);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authenticationBloc,
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  void _handlePushClick(Month month) {
    authenticationBloc.add(NotificationClickedEvent(month: month));
  }
}
