import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:list_view/domain/repository/user_repository.dart';
import 'package:list_view/locator/locator.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    final UserRepository userRepository = getIt<UserRepository>();
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        final bool hasToken = await userRepository.getToken();
        if (hasToken) {
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
      }
      if (event is LoggedIn) {
        emit(AuthenticationLoading());
        await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is LoggedOut) {
        emit(AuthenticationLoading());
        await userRepository.deleteToken();
        emit(AuthenticationUnauthenticated());
      }
    });
  }
}
