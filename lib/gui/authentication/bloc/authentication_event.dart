part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});
}

class LoggedOut extends AuthenticationEvent {}

class NotificationClickedEvent extends AuthenticationEvent {
  final Month month;

  const NotificationClickedEvent({required this.month});
}
