part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignedIn extends AuthState {}

class AuthNotSignedIn extends AuthState {}

class AuthLoading extends AuthState {}
