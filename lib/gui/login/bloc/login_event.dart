part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({required this.loginUser});

  final LoginUser loginUser;
}
