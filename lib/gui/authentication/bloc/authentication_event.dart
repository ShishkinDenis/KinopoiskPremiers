part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn({required this.token});

  final String token;
}

class LoggedOut extends AuthenticationEvent {}

class NotificationClickedEvent extends AuthenticationEvent {
  const NotificationClickedEvent({required this.month});

  final Month month;
}
