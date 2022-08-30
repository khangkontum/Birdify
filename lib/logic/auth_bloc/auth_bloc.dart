import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/app_user.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<AppUser>? userSubscription;

  AuthBloc(this._authRepository)
      : super(const AuthState._(
          status: AuthStatus.unauthenticated,
        )) {
    on<LoggedInEvent>(
      _handleLoggedInEvent,
    );

    on<LoggedOutEvent>(_handleLoggedOutEvent);

    userSubscription = _authRepository.user.listen((user) {
      add(LoggedInEvent(user: user));
    });
  }

  void _handleLoggedInEvent(
    LoggedInEvent event,
    Emitter<AuthState> emit,
  ) {
    if (event.user.isNotEmpty) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: event.user,
      ));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  void _handleLoggedOutEvent(
    LoggedOutEvent event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authRepository.signOut());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  @override
  Future<void> close() {
    userSubscription?.cancel();
    return super.close();
  }
}
