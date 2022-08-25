part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final User user;
  const AuthState._({
    required this.status,
    this.user = User.empty,
  });

  AuthState copyWith({required AuthStatus status, User? user}) {
    return AuthState._(
      status: status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status];
}

// class AuthInitial extends AuthState {}

// class UninitializedState extends AuthState {}

// class AuthenticatedState extends AuthState {}

// class UnauthenticatedState extends AuthState {}

// class LoadingAuthenticationState extends AuthState {}
