part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class NotificationClickedState extends AuthenticationState {
  final Month month;

  const NotificationClickedState({required this.month});
}
