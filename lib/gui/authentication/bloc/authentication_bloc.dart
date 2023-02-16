import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/domain/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.userRepository}) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        final hasToken = await userRepository.getToken();
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
      if (event is NotificationClickedEvent) {
        emit(NotificationClickedState(month: event.month));
      }
    });
  }

  final UserRepository userRepository;
}
