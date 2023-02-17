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
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
    on<NotificationClickedEvent>(_notificationClicked);
  }

  final UserRepository userRepository;

  Future<void> _appStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    final hasToken = await userRepository.getToken();
    if (hasToken) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _loggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.persistToken(event.token);
    emit(AuthenticationAuthenticated());
  }

  Future<void> _loggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.deleteToken();
    emit(AuthenticationUnauthenticated());
  }

  Future<void> _notificationClicked(
    NotificationClickedEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(NotificationClickedState(month: event.month));
  }
}
