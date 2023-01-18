part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final LoginUser loginUser;

  LoginButtonPressed({required this.loginUser});
}
