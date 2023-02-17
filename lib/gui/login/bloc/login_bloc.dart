import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/domain/model/login_user.dart';
import 'package:list_view/domain/repository/user_repository.dart';
import 'package:list_view/gui/authentication/bloc/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.userRepository, required this.authenticationBloc})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(_loginButtonPressed);
  }

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  Future<void> _loginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final token = await userRepository.authenticate(
        username: event.loginUser.email,
        password: event.loginUser.password,
      );
      authenticationBloc.add(LoggedIn(token: token));
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
